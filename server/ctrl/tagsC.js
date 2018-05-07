'use strict';

const { Op } = require('sequelize');
const models = require('../db/models');
const { Tag, Artist } = models;

// check for duplicates, validate data, create new tag
const paranoidCreate = data => {
  return new Promise((resolve, reject) => {
    data = validate(data);
    // if data is invalid
    if (!data) {
      // 400: bad request
      reject(400);
    } else {
      let { name } = data;
      getMatch(name)
        .then(dupes => {
          // if a tag like this already exists
          if (dupes) {
            // 409: conflict
            reject(409);
          } else {
            create(data);
          }
        })
        .catch(err => reject(err));
    }
  });
};

// doesn't validate or chekc anything
const create = data => {
  return new Promise((resolve, reject) => {
    Tag.create(data)
      .then(response => {
        // returns new tag
        if (response) resolve(response);
      })
      .catch(err => {
        console.log('tag creation err', err);
        reject(500);
      });
  });
};

// returns tags whose names match `q` exactly (case-insensitive)
const getMatch = q => {
  return new Promise((resolve, reject) => {
    Tag.findOne({
      where: {
        name: {
          [Op.iLike]: `${q}`
        }
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
        name: {
          [Op.iLike]: `%${q}%`
        }
      }
    })
      .then(tags => resolve(tags))
  });
};

// get all tags attached to given artist
const getByArtist = id => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT t.name, t.id
        FROM "Artists" a
      LEFT JOIN "ArtistTags" at
        ON at."ArtistId" = a.id
      LEFT JOIN "Tags" t
        ON t.id = at."TagId"
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
        if (match) {
          resolve(match);
        } else {
          paranoidCreate({ name })
            .then(tag => resolve(tag))
            .catch(err => reject(err));
        }
      });
  });
};

// validate incoming tag data
const validate = data => {
  let { name } = data;
  if (name) {
    return { name };
  } else {
    return false;
  }
};

module.exports = { getMatch, findSimilar, getByArtist, create, findOrCreate };