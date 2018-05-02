'use strict';

const { Router } = require('express');
const router = Router();

router.use(require('./auth'));
router.use('/insta', require('./insta'));

module.exports = router;