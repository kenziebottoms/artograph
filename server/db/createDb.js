'use strict';

const models = require('./models');
const { generateHash } = require('../ctrl/auth');

const { artists } = require('./seeders/artists');
const { tags } = require('./seeders/tags');

models.sequelize.sync({ force: true })
  .then(() => {
    return models.User.create({
      username: 'kenzie',
      email: 'kenziebottoms@gmail.com',
      password: generateHash('kenzie')
    });
  })
  .then(() => {
    return models.Artist.bulkCreate(artists);
  }).then(() => {
    return models.Tag.bulkCreate(tags);
  }).then(() => {
    process.exit();
  });