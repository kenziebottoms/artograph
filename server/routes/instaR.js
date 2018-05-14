'use strict';

const { Router } = require('express');
const router = Router();

const insta = require('../ctrl/instaC');

router.get('/:uid', (req, res, next) => {
  let { uid } = req.params;
  insta.getInfo(uid)
    .then(meta => res.status(200).json(meta))
    .catch(err => next(err));
});

module.exports = router;