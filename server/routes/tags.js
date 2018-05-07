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

router.post('/', (req, res, next) => {
  const { Tag } = req.app.get('models');
  let data = validate(req.body);
  if (data) {
    Tag.findAll({
      where: {
        name: {
          [Op.iLike]: `${data.name}`
        }
      }
    })
      .then(tags => {
        if (tags.length > 0) {
          res.sendStatus(409);
        } else {
          Tag.create(data)
            .then(response => {
              if (response) res.status(200).json(response);
            })
            .catch(err => next(err));
        }
      })
      .catch(err => next(err));
  } else {
    res.sendStatus(400);
  }
});

// returns tags that match `q` by name
router.get('/like/:q', (req, res, next) => {
  const { Tag } = req.app.get('models');
  Tag.findAll({
    where: {
      name: {
        [Op.iLike]: `%${req.params.q}%`
      }
    }
  })
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

// returns tags that match `q` more or less exactly
router.get('/match/:q', (req, res, next) => {
  const { Tag } = req.app.get('models');
  console.log(req.params.q);
  Tag.findAll({
    where: {
      name: {
        [Op.iLike]: `${req.params.q}`
      }
    }
  })
    .then(tags => {
      res.status(200).json(tags);
    })
    .catch(err => next(err));
});

const validate = data => {
  let { name } = data;
  if (name) {
    return { name };
  }
};

module.exports = router;