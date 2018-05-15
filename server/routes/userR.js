'use strict';

const { Router } = require('express');
const router = Router();
const {
  checkAuthStrict,
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
    .then(faves => res.status(200).json(faves))
    .catch(err => next(err));
});

router.use(checkAuthStrict);

// gets active user's faves
router.get('/faves', (req, res, next) => {
  // passes to verbose=true
  if (req.query.verbose) return next();
  // gets just `id`s
  getFaves(req.user.id)
    .then(faves => res.status(200).json(faves))
    .catch(err => next(err));
});

// /faves?verbose=true
router.get('/faves', (req, res, next) => {
  getFavoriteArtists(req.user.id)
    .then(faves => res.status(200).json(faves))
    .catch(err => next(err));
});

// adds a new favorite between the authenticated user and the given artist
router.post('/faves/:artistId', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => user.addArtist(req.params.artistId, { returning: true }))
    .then(response => {
      // comes back as [[{ favorite }]]
      if (response.length > 0) response = response[0];
      if (response.length > 0) response = response[0];
      res.status(200).json(response);
    })
    .catch(err => next(err));
});

// deletes favorite between the authenticated user and the given artist
router.delete('/faves/:id', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => user.removeArtist(req.params.id, { returning: true }))
    .then(response => res.status(200).json(1))
    .catch(err => next(err));
});

module.exports = router;