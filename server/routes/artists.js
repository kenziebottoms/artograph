'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const { Op } = require('sequelize');

// returns all artists alphabetized by last name
router.get('/', (req, res, next) => {
  const models = req.app.get('models');
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

// Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.
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

// Returns one artist by `id`.
router.get('/:id', (req, res, next) => {
  const models = req.app.get('models');
  models.sequelize.query(`SELECT
      a.*,
      STRING_AGG(t.name,',') as Tags
    FROM "Artists" a
    LEFT JOIN "ArtistTags" at
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

// Returns a list of the tags with their `id`s associated with the provided artist.
router.get('/:id/tags', (req, res, next) => {
  const models = req.app.get('models');
  models.sequelize.query(`SELECT t.name, t.id
    FROM "Artists" a
    LEFT JOIN "ArtistTags" at
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

router.post('/', (req, res, next) => {
  const { Artist } = req.app.get('models');
  const data = validate(req.body);
  console.log(data);
  if (data) {
    let { email } = data;
    if (email) {
      Artist.findAll({ where: { email } })
        .then(artist => {
          if (artist.length > 0) {
            res.sendStatus(409);
          } else {
            Artist.create(data)
              .then(response => {
                if (response) res.send(200).json(response);
              })
              .catch(err => next(err));
          }
        })
        .catch(err => next(err));
    }
  } else {
    res.sendStatus(400);
  }
});

// Updates the artist with the given `id` without overwriting unaddressed properties.
router.patch('/:id', (req, res, next) => {
  const { Artist } = req.app.get('models');
  const data = req.body;
  Artist.update(data, {
    where: { id: req.params.id }
  })
    .then(statusCode => res.send(statusCode ? 200 : 500))
    .catch(err => console.log(err));
});

const sortByDistance = (artists, { lat, lng }) => {
  return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
}
const sortAlphabetically = (artists) => {
  return _.sortBy(artists, [a => a.name.split(' ').reverse().join(' ')]);
};
const validate = body => {
  let { email, name, lat, lng, insta } = body;
  if (email) {
    email = email.toLowerCase();
    let emailRx = /[a-z0-9]+@[a-z0-9]+\.[a-z]+/g;
    if (!emailRx.test(email)) {
      return false;
    }
  }
  if (insta) {
    insta = insta.toLowerCase().trim();
    if (insta.split('').reverse()[0] == '/') {
      insta = insta.slice(0,insta.length-1);
    }
    let instaRx = /[a-z]{4,5}:\/\/www.instagram.com\/[\.a-z0-9_-]+/gi;
    if (!instaRx.test(insta)) {
      return false;
    }
  }
  if (isNaN(lat) || isNaN(lng)) {
    return false;
  } else {
    lat = parseFloat(lat);
    lng = parseFloat(lng);
  }
  return { email, name, lat, lng, insta };
};

module.exports = router;