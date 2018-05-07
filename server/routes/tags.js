'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const { Op } = require('sequelize');

router.get('/', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll()
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

module.exports = router;