'use strict';

const { Router } = require('express');
const router = Router();
const {
  checkAuth,
  getAuthUser
} = require('../ctrl/authC');
const {
  getFaves,
  getFavoriteArtists
} = require('../ctrl/userC');
const path = require('path');

router.get('/', getAuthUser);
router.get('/:id/faves', (req, res, next) => {
  getFaves(req.params.id)
    .then(faves => {
      res.status(200).json(faves);
    })
    .catch(err => next(err));
});

router.use(checkAuth);

router.get('/faves', (req, res, next) => {
  if (req.query.verbose) return next();
  getFaves(req.user.id)
    .then(faves => {
      res.status(200).json(faves);
    })
    .catch(err => next(err));
});

// /faves?verbose=true
router.get('/faves', (req, res, next) => {
  getFavoriteArtists(req.user.id)
    .then(faves => res.status(200).json(faves))
    .catch(err => next(err));
});

router.post('/faves/:id', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => {
      return user.addArtist(req.params.id, { returning: true });
    })
    .then(response => {
      // comes back as [[{ favorite }]]
      if (response.length > 0) response = response[0];
      if (response.length > 0) response = response[0];
      res.status(200).json(response);
    })
    .catch(err => next(err));
});

router.delete('/faves/:id', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => user.removeArtist(req.params.id, { returning: true }))
    .then(response => res.status(200).json(1))
    .catch(err => next(err));
});

module.exports = router;