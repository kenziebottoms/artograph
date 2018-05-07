'use strict';

const { Router } = require('express');
const router = Router();

const insta = require('../ctrl/instaC');

router.get('/meta/:uid', (req, res, next) => {
  let { uid } = req.params;
  insta.getMeta(uid)
    .then(meta => res.status(200).json(meta))
    .catch(err => next(err));
});

router.get('/posts/:uid', (req, res, next) => {
  let { uid } = req.params;
  insta.getUserPosts(uid)
    .then(posts => res.status(200).send(posts))
    .catch(err => next(err));
});

module.exports = router;