'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const { Op } = require('sequelize');

router.get('/', (req, res, next) => {
  const { Artist } = req.app.get('models');
  // returns all artists alphabetized by last name
  Artist.findAll()
    .then(artists => {
      if (req.query.lat && req.query.lng) {
        let { lat, lng } = req.query;
        res.status(200).json(sortByDistance(artists, {lat, lng}));
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
      lng: {
        // longitude is within allowance lat/long points of given longitude
        [Op.and]: {
          [Op.gt]: parseFloat(lng) - parseFloat(allowance),
          [Op.lt]: parseFloat(lng) + parseFloat(allowance)
        }
      }
    }
  })
    .then(artists => res.status(200).json(sortByDistance(artists, { lat, lng })))
    .catch(err => next(err));
});

router.get('/:id', (req, res, next) => {
  const { Artist } = req.app.get('models');
  Artist.findById(req.params.id)
    .then(artist => {
      res.status(200).json(artist);
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