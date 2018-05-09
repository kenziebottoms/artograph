'use strict';

const { Router } = require('express');
const router = Router();

router.use(require('./authR'));
router.use('/insta', require('./instaR'));
router.use('/artists', require('./artistsR'));
router.use('/tags', require('./tagsR'));
router.use('/user', require('./userR'));

// error handling
router.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status).json(err);
});

module.exports = router;