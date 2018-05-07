'use strict';

const { Router } = require('express');
const router = Router();

const {
  getMatch,
  findSimilar,
  create
} = require('../ctrl/tagsC.js');

// returns all tags
router.get('/', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll()
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// Checks for an existing tag with the given `name`; if not found, validates data, and adds new tag.
router.post('/', (req, res, next) => {
  create(req.body)
    .then(tag => {
      res.status(200).json(tag);
    })
    .catch(err => {
      res.sendStatus(err);
    });
});

// returns tags that match `q` by name
router.get('/like/:q', (req, res, next) => {
  findSimilar(req.params.q)
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// returns tags that match `q` more or less exactly
router.get('/match/:q', (req, res, next) => {
  getMatch(req.params.q)
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

module.exports = router;