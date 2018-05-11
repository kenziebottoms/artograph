'use strict';

const _ = require('lodash');
const models = require('../db/models');
const { Op } = require('sequelize');

const { Artist, Tag } = models;
const tags = require('./tagsC');

// get one artist by id
const getById = id => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT
        a.*,
        STRING_AGG(t.name,',') as Tags
      FROM "Artists" a
      LEFT JOIN "ArtistTags" at
        ON at."artistId" = a.id
      LEFT JOIN "Tags" t
        ON t.id = at."tagId"
      WHERE a.id = ${id}
      GROUP BY a.id
      LIMIT 1
    `, { type: models.sequelize.QueryTypes.SELECT })
      .then(artist => resolve(artist[0]))
      .catch(err => reject(err));
  });
};

// get all artists
const getAll = () => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT
        a.*,
        STRING_AGG(t.name,',') as Tags
      FROM "Artists" a
      LEFT JOIN "ArtistTags" at
        ON at."artistId" = a.id
      LEFT JOIN "Tags" t
        ON t.id = at."tagId"
      GROUP BY a.id
      `, { type: models.sequelize.QueryTypes.SELECT })
      .then(artists => resolve(artists))
      .catch(err => reject(err));
  });
};

// creates without checking anything
const create = data => {
  return new Promise((resolve, reject) => {
    let artist;
    Artist.create(data, { returning: true })
      .then(a => {
        artist = a;
        if (!data.tags) return resolve(artist);
        // find or create each tag name as object
        Promise.all(data.tags.map(t => tags.findOrCreate(t)))
          .then(tags => {
            // add all tags to that artist
            let ids = tags.map(t => t.id);
            return artist.addTag(ids);
          })
          .then(tagsAdded => resolve(artist))
          .catch(err => reject(err));
      })
      .catch(err => reject(err));
  });
};

// validates data and edits
const edit = (id, data) => {
  return new Promise((resolve, reject) => {
    data = validate(data);
    if (data.error) return reject(data.error);
    Artist.update(data, {
      where: { id },
      returning: true
    })
      .then(response => {
        if (!data.tags) return resolve(data);
        let artist;
        Artist.findById(id)
          .then(a => {
            artist = a;
            return Promise.all(data.tags.map(t => tags.findOrCreate(t)));
          })
          .then(tags => {
            // add all tags to that artist
            let ids = tags.map(t => t.id);
            return artist.addTag(ids);
          })
          .then(tagsAdded => resolve(artist))
          .catch(err => reject(err));
        // find or create each tag name as object
      })
      .catch(err => reject(err));
  });
};

// validates then creates
const paranoidCreate = data => {
  return new Promise((resolve, reject) => {
    data = validate(data);
    if (data.error) return reject(data.error);
    let { email } = data;
    if (email) {
      // check for duplicate based on email
      Artist.findAll({ where: { email }, raw: true })
        .then(dupes => {
          // if there's already an artist with this email
          if (dupes && dupes.length > 0) {
            // 409: conflict
            reject({ status: 409, message: 'There is already an artist in the database with this email.' });
          } else {
            create(data)
              .then(response => resolve(response))
              .catch(err => reject(err));
          }
        })
        .catch(err => reject(err));
    } else {
      create(data)
        .then(response => resolve(response))
        .catch(err => reject(err));
    }
  });
};

// get all artists sorted by last name
const getAllAlpha = () => {
  return new Promise((resolve, reject) => {
    getAll()
      .then(artists => resolve(sortAlphabetically(artists)))
      .catch(err => reject(err));
  });
  ;
}

// get all artists sorted by distance from [`lat`, `lng`]
const getAllDistance = ({ lat, lng }) => {
  return new Promise((resolve, reject) => {
    getAll()
      .then(artists => {
        resolve(sortByDistance(artists, { lat, lng }));
      })
      .catch(err => reject(err));
  });
};

// Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.
const getNearby = data => {
  return new Promise((resolve, reject) => {
    // if data is invalid
    let { lat, lng, allowance } = data || null;
    if (!data || isNaN(lat) || isNaN(lng) || isNaN(allowance)) {
      // 400: bad request
      // 400: bad request
      return reject({ status: 400, message: 'Please provide valid `lat`, `lng`, and `allowance` properties.' });
    }
    Artist.findAll({
      where: {
        // latitude is within allowance lat/long points of given latitude
        lat: {
          [Op.and]: {
            [Op.gt]: parseFloat(lat) - parseFloat(allowance),
            [Op.lt]: parseFloat(lat) + parseFloat(allowance)
          }
        },
        // longitude is within allowance lat/long points of given longitude
        lng: {
          [Op.and]: {
            [Op.gt]: parseFloat(lng) - parseFloat(allowance),
            [Op.lt]: parseFloat(lng) + parseFloat(allowance)
          }
        }
      },
      raw: true
    })
      .then(artists => resolve(artists))
      .catch(err => reject(err));
  });
}

const sortByDistance = (artists, { lat, lng }) => {
  return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
}
const sortAlphabetically = (artists) => {
  return _.sortBy(artists, [a => a.name.split(' ').reverse().join(' ')]);
};

// validates and cleans up incoming artist post data
const validate = body => {
  if (!body || _.isEmpty(body)) {
    return {
      error: {
        // 400: bad request
        status: 400, message: 'Please send something.'
      }
    };
  }
  let { email, name, lat, lng, insta, tags, region, followers } = body;
  if (email) {
    email = email.toLowerCase();
    let emailRx = /[a-z0-9]+@[a-z0-9]+\.[a-z]+/g;
    if (!emailRx.test(email)) {
      return {
        error: {
          // 400: bad request
          status: 400,
          message: 'Please provide a valid email address.'
        }
      };
    }
  }
  if (insta) {
    insta = insta.toLowerCase().trim();
    if (insta.split('').reverse()[0] == '/') {
      insta = insta.slice(0, insta.length - 1);
    }
    let instaRx = /[a-z0-9_\.]+/gi;
    if (!instaRx.test(insta)) {
      return {
        error: {
          // 400: bad request
          status: 400,
          message: 'Please provide a valid Instagram profile.'
        }
      };
    }
  }
  if (followers) {
    let followerRx = /[0-9]+/gi;
    if (!followerRx.test(followers)) {
      return {
        error: {
          // 400: bad request
          status: 400,
          message: 'Please provide a valid follower count.'
        }
      };
    }
  }
  if (lat && lng) {
    if (isNaN(lat) || isNaN(lng)) {
      return {
        error: {
          // 400: bad request
          status: 400,
          message: 'Please provide a valid email latitude and longitude.'
        }
      };
    } else {
      lat = parseFloat(lat);
      lng = parseFloat(lng);
    }
  }
  // splits by , trims whitespace, removes empty strings
  if (tags) tags = _.compact(tags.split(',').map(s => s.trim(/\s/)));
  return { email, name, lat, lng, insta, tags, region, followers };
};

module.exports = { paranoidCreate, getById, getAllAlpha, getAllDistance, getNearby, edit };