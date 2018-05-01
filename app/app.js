'use strict';

const express = require('express');
const app = express();
const pug = require('pug');
const path = require('path');

app.set('view engine', 'pug');
app.use('/public', express.static(path.join(__dirname, 'public')));

require('dotenv').config();

app.use(require('./routes'));

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});