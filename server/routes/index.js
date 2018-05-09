'use strict';

const { Router } = require('express');
const router = Router();
const { getFaves } = require('../ctrl/userC');

router.use(require('./authR'));
router.use('/insta', require('./instaR'));
router.use('/artists', require('./artistsR'));
router.use('/tags', require('./tagsR'));
router.get('/user/:id/faves', (req, res, next) => {
  getFaves(req.params.id)
    .then(faves => {
      res.status(200).json(faves);
    })
    .catch(err => next(err));
});

// error handling
router.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status).json(err);
});

module.exports = router;