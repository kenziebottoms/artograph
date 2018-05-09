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

module.exports = {
  getFaves
};