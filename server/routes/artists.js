'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const { Op } = require('sequelize');

router.get('/', (req, res, next) => {
  const models = req.app.get('models');
  // returns all artists alphabetized by last name
  models.sequelize.query(`SELECT
      a.*,
      STRING_AGG(t.name,',') as Tags
    FROM "Artists" a
    LEFT JOIN "ArtistTags" at
      ON at."ArtistId" = a.id
    LEFT JOIN "Tags" t
      ON t.id = at."TagId"
    GROUP BY a.id`,
    { type: models.sequelize.QueryTypes.SELECT })
    .then(artists => {
      let lat = parseFloat(req.query.lat);
      let lng = parseFloat(req.query.lng);
      // checks that both are numbers
      if (lat == lat && lng == lng) {
        res.status(200).json(sortByDistance(artists, { lat, lng }));
      } else {
        res.status(200).json(sortAlphabetically(artists));
      }
    })
    .catch(err => next(err));
});

router.get('/nearby', (req, res, next) => {
  const { Artist } = req.app.get('models');
  let { lat, lng, allowance } = req.query;
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
    .then(artists => res.status(200).json(sortByDistance(artists, { lat, lng })))
    .catch(err => next(err));
});

router.get('/:id', (req, res, next) => {
  const models = req.app.get('models');
  models.sequelize.query(`SELECT
      a.*,
      STRING_AGG(t.name,',') as Tags
    FROM "Artists" a
    JOIN "ArtistTags" at
      ON at."ArtistId" = a.id
    LEFT JOIN "Tags" t
      ON t.id = at."TagId"
    WHERE a.id = ${req.params.id}
    GROUP BY a.id`,
    { type: models.sequelize.QueryTypes.SELECT })
    .then(artist => {
      res.status(200).json(artist);
    })
    .catch(err => next(err));
});

router.get('/:id/tags', (req, res, next) => {
  const models = req.app.get('models');
  models.sequelize.query(`SELECT t.name, t.id
    FROM "Artists" a
    JOIN "ArtistTags" at
      ON at."ArtistId" = a.id
    LEFT JOIN "Tags" t
      ON t.id = at."TagId"
    WHERE a.id = ${req.params.id}
    GROUP BY t.id`,
    { type: models.sequelize.QueryTypes.SELECT })
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

const sortByDistance = (artists, { lat, lng }) => {
  return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
}
const sortAlphabetically = (artists) => {
  return _.sortBy(artists, [a => a.name.split(' ').reverse().join(' ')]);
};

module.exports = router;