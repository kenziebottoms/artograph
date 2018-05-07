'use strict';

const { Router } = require('express');
const router = Router();

router.use(require('./authR'));
router.use('/insta', require('./instaR'));
router.use('/artists', require('./artistsR'));
router.use('/tags', require('./tagsR'));

module.exports = router;