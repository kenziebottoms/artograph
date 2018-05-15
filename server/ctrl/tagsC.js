'use strict';

const { Op } = require('sequelize');
const models = require('../db/models');
const { Tag, Artist } = models;

// check for duplicates, validate data, create new tag
const paranoidCreate = data => {
  return new Promise((resolve, reject) => {
    data = validate(data);
    if (data.error) return reject(data.error);
    let { name } = data;
    getMatch(name)
      .then(dupes => {
        // if a tag like this already exists
        if (dupes && dupes.length > 0) {
          // 409: conflict
          reject({ status: 409, message: 'A tag with a similar name already exists.' });
        } else {
          create(data)
            .then(response => resolve(response))
            .catch(err => reject(err));
        }
      })
      .catch(err => reject(err));
  });
};

// doesn't validate or chekc anything
const create = data => {
  return new Promise((resolve, reject) => {
    Tag.create(data)
      .then(response => resolve(response))
      .catch(err => reject(err));
  });
};

// returns tags whose names match `q` exactly (case-insensitive)
const getMatch = q => {
  return new Promise((resolve, reject) => {
    Tag.findOne({
      where: {
        name: { [Op.iLike]: `${q}` }
      }
    })
      .then(tags => resolve(tags))
      .catch(err => reject(err));
  });
};

// returns tags whose names contain `q` (case-insensitive)
const findSimilar = q => {
  return new Promise((resolve, reject) => {
    Tag.findAll({
      where: {
        name: { [Op.iLike]: `%${q}%` }
      }
    })
      .then(tags => resolve(tags))
      .catch(err => reject(err));
  });
};

// get all tags attached to given artist
const getByArtist = id => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT t.name, t.id
        FROM "Artists" a
      JOIN "ArtistTags" at
        ON at."artistId" = a.id
      JOIN "Tags" t
        ON t.id = at."tagId"
      WHERE a.id = ${id}
      GROUP BY t.id
    `, { type: models.sequelize.QueryTypes.SELECT })
      .then(tags => resolve(tags))
      .catch(err => reject(err));
  });
};

// finds a match for or creates a tag with the given name
const findOrCreate = name => {
  return new Promise((resolve, reject) => {
    getMatch(name)
      .then(match => {
        if (match) return resolve(match);
        paranoidCreate({ name })
          .then(tag => resolve(tag))
          .catch(err => reject(err));
      });
  });
};

// validates data and edits
const edit = (id, data) => {
  return new Promise((resolve, reject) => {
    data = validate(data);
    if (data.error) return reject(data.error);
    Tag.update(data, {
      where: { id },
      returning: true
    })
      .then(response => resolve(response))
      .catch(err => reject(err));
  });
};

// validate incoming tag data
const validate = data => {
  let { name } = data;
  if (name) {
    return { name };
  } else {
    return {
      error: {
        // 400: bad request
        status: 400,
        message: 'Please provide a valid `name` property.'
      }
    };
  }
};

module.exports = {
  getMatch,
  findSimilar,
  edit,
  getByArtist,
  paranoidCreate,
  findOrCreate
};