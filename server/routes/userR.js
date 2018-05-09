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
    .catch(err => {
      res.status(500).json(err);
    });
});

module.exports = router;