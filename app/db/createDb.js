'use strict';

const { artists } = require('./seeders/artists');
const models = require('./models');
const { generateHash } = require('../auth');

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
    process.exit();
  });