'use strict';

const models = require('../db/models');

// get the ids of only the artists the given user has favorited
const getFaves = uid => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT
        a.id
      FROM "Artists" a
      JOIN "Favorites" f
        ON f."userId" = ${uid}
        AND f."artistId" = a.id
      GROUP BY a.id
    `, { type: models.sequelize.QueryTypes.SELECT })
      .then(artists => resolve(artists))
      .catch(err => reject(err));
  });
};

// get the info of only the artists the given user has favorited
const getFavoriteArtists = uid => {
  return new Promise((resolve, reject) => {
    models.sequelize.query(`
      SELECT
        a.*,
        STRING_AGG(t.name,',') as Tags
      FROM "Artists" a
      JOIN "Favorites" f
        ON f."userId" = ${uid}
        AND f."artistId" = a.id
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

module.exports = {
  getFaves,
  getFavoriteArtists
};