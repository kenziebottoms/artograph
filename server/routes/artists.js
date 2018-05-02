'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');

router.get('/', (req, res, next) => {
  const { Artist } = req.app.get('models');
  // returns all artists alphabetized by last name
  Artist.findAll()
    .then(artists => {
      artists = _.sortBy(artists, [a => a.name.split(' ').reverse()[0]]);
      res.status(200).json(artists);
    })
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

module.exports = router;