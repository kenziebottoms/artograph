'use strict';

const { Router } = require('express');
const router = Router();

router.use(require('./authR'));
router.use('/insta', require('./instaR'));
router.use('/artists', require('./artistsR'));
router.use('/tags', require('./tagsR'));
// error handling
router.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status).json(err);
});

module.exports = router;