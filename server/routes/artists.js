'use strict';

const { Router } = require('express');
const router = Router();

router.get('/', (req, res, next) => {
  const { Artist } = req.app.get('models');
  Artist.findAll()
    .then(artists => {
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