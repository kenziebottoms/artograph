'use strict';

const express = require('express');
const app = express();

require('dotenv').config();

app.use(require('./routes'));

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});