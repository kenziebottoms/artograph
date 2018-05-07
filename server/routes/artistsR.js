'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const {
  getById,
  getAllAlpha,
  getAllDistance,
  getNearby
} = require('../ctrl/artistC');
const tags = require('../ctrl/tagsC');

// returns all artists alphabetized by last name
router.get('/', (req, res, next) => {
  let lat = parseFloat(req.query.lat);
  let lng = parseFloat(req.query.lng);
  // checks that both are numbers
  if (!isNaN(lat) && !isNaN(lng)) {
    getAllDistance({ lat, lng })
      .then(artists => {
        res.status(200).json(artists);
      })
      .catch(err => next(err));
  } else {
    getAllAlpha()
      .then(artists => {
        res.status(200).json(artists);
      })
      .catch(err => next(err));
  }
});

// Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.
router.get('/nearby', (req, res, next) => {
  getNearby(req.query)
    .then(artists => res.status(200).json(artists))
    .catch(err => next(err));
});

// Returns one artist by `id`.
router.get('/:id', (req, res, next) => {
  getById(req.params.id)
    .then(artist => {
      res.status(200).json(artist);
    })
    .catch(err => next(err));
});

// Returns a list of the tags with their `id`s associated with the provided artist.
router.get('/:id/tags', (req, res, next) => {
  tags.getByArtist(req.params.id)
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// Checks for an existing artist with the given `email`; if not found, validates data, and adds new artist.
router.post('/', (req, res, next) => {
  const { Artist, Tag } = req.app.get('models');
  const data = validate(req.body);
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
                console.log(response);
                Promise.all(data.tags.map(t => {

                }))
                if (response) {
                  res.status(200).json(response);
                }
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
  let { email, name, lat, lng, insta, tags } = body;
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
      insta = insta.slice(0, insta.length - 1);
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
  if (tags) {
    tags = tags.split(',').map(s => s.trim());
  }
  return { email, name, lat, lng, insta };
};

module.exports = router;