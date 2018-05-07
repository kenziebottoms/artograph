'use strict';

const _ = require('lodash');
const models = require('../db/models');

const { Artist, Tag } = models;

// get one artist by id
const getById = id => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT
        a.*,
        STRING_AGG(t.name,',') as Tags
      FROM "Artists" a
      LEFT JOIN "ArtistTags" at
        ON at."ArtistId" = a.id
      LEFT JOIN "Tags" t
        ON t.id = at."TagId"
      WHERE a.id = ${id}
      GROUP BY a.id
    `, { type: models.sequelize.QueryTypes.SELECT })
      .then(artist => resolve(artist))
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
        ON at."ArtistId" = a.id
      LEFT JOIN "Tags" t
        ON t.id = at."TagId"
      GROUP BY a.id
      `, { type: models.sequelize.QueryTypes.SELECT })
      .then(artists => resolve(artists))
      .catch(err => reject(err));
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

const sortByDistance = (artists, { lat, lng }) => {
  return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
}
const sortAlphabetically = (artists) => {
  return _.sortBy(artists, [a => a.name.split(' ').reverse().join(' ')]);
};

module.exports = { getById, getAllAlpha, getAllDistance };