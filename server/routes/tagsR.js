'use strict';

const { Router } = require('express');
const router = Router();

const {
  getMatch,
  findSimilar,
  paranoidCreate,
  edit
} = require('../ctrl/tagsC.js');

// returns all tags
router.get('/', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll({ order: ['id'] })
    .then(tags => res.status(200).json(tags))
    .catch(err => next(err));
});

// Checks for an existing tag with the given `name`; if not found, validates data, and adds new tag.
router.post('/', (req, res, next) => {
  paranoidCreate(req.body)
    .then(tag => res.status(200).json(tag))
    .catch(err => next(err));
});

// returns all tags
router.get('/:id', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findById(req.params.id)
    .then(tags => res.status(200).json(tags))
    .catch(err => next(err));
});

router.patch('/:id', (req, res, next) => {
  const { Tag } = req.app.get('models');
  edit(req.params.id, req.body)
    .then(response => res.status(200).json(response))
    .catch(err => next(err));
})

// returns tags whose names contain `q`
router.get('/like/:q', (req, res, next) => {
  findSimilar(req.params.q)
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// returns tags whose names match `q` exactly (case-insensitive)
router.get('/matching/:q', (req, res, next) => {
  getMatch(req.params.q)
    .then(tags => res.status(200).json(tags))
    .catch(err => next(err));
});

module.exports = router;