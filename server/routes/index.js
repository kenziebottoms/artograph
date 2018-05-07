'use strict';

const { Router } = require('express');
const router = Router();

router.use(require('./auth'));
router.use('/insta', require('./insta'));
router.use('/artists', require('./artists'));
router.use('/tags', require('./tags'));

module.exports = router;