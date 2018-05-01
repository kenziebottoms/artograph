'use strict';

const { Router } = require('express');
const router = Router();
const path = require('path');

router.use('/insta', require('./insta'));
router.get('/', (req, res, next) => {
  res.render(path.join(__dirname, '../templates/index'));
});

module.exports = router;