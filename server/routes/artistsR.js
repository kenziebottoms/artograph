'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const {
  getById,
  getAllAlpha,
  getAllDistance,
  getNearby,
  paranoidCreate,
  edit
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
    .then(artist =>  res.status(200).json(artist))
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
  paranoidCreate(req.body)
    .then(response => {
      res.status(200).json(response);
    })
    .catch(err => next(err));
});

// Updates the artist with the given `id` without overwriting unaddressed properties.
router.patch('/:id', (req, res, next) => {
  edit(req.params.id, req.body)
    .then(artist => res.status(200).json(artist))
    .catch(err => next(err));
});

module.exports = router;