'use strict';

const { Router } = require('express');
const router = Router();
const _ = require('lodash');
const { Op } = require('sequelize');

// returns all tags
router.get('/', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll()
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// returns tags that match `q` by name
router.get('/like/:q', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll({
    where: {
      name: {
        [Op.like]: `%${req.params.q}%`
      }
    }
  })
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

module.exports = router;