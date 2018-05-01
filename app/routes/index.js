'use strict';

const { Router } = require('express');
const router = Router();

router.use('/insta', require('./insta'));

module.exports = router;