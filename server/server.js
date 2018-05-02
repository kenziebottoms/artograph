'use strict';

const express = require('express');
const app = express();
const path = require('path');

app.set("models", require('./db/models'));
app.use(express.static(path.join(__dirname, '../client')));

require('dotenv').config();

// auth
const session = require('express-session');
const passport = require('passport');
const bodyParser = require('body-parser');

app.use(session({
  secret: 'keyboard cat',
  resave: true,
  saveUninitialized: true
}));

require('./db/config/passport-strat.js');
app.use(passport.initialize());
app.use(passport.session());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(require('./routes'));

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});