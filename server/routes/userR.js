'use strict';

const { Router } = require('express');
const router = Router();
const {
  checkAuth,
  getAuthUser
} = require('../ctrl/authC');
const { getFaves } = require('../ctrl/userC');
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
  getFaves(req.user.id)
    .then(faves => {
      res.status(200).json(faves);
    })
    .catch(err => next(err));
});

router.post('/faves/:id', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => {
      return user.addArtist(req.params.id);
    })
    .then(({data}) => {
      res.status(200).json(req.params.id);
    })
    .catch(err => next(err));
});

router.delete('/faves/:id', (req, res, next) => {
  const { Artist, User } = req.app.get('models');
  User.findById(req.user.id)
    .then(user => {
      return user.removeArtist(req.params.id);
    })
    .then(response => {
      res.status(200).json(req.params.id);
    })
    .catch(err => next(err));
});

module.exports = router;