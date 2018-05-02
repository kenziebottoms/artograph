'use strict';

const { Router } = require('express');
const router = Router();

const insta = require('../ctrl/instagram');

router.get('/meta/:uid', (req, res, next) => {
  let { uid } = req.params;
  insta.getMeta(uid)
    .then(meta => res.status(200).json(meta))
    .catch(err => console.log(err));
});

router.get('/posts/:uid', (req, res, next) => {
  let { uid } = req.params;
  insta.getUserPosts(uid)
    .then(posts => res.status(200).send(posts))
    .catch(err => console.log(err));
});

module.exports = router;