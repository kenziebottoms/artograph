'use strict';

const { Router } = require('express');
const router = Router();
const {
  register,
  login,
  logout
} = require('../ctrl/auth');
const path = require('path');

router.post('/register', register);
router.get('/register', (req, res, next) => {
  res.render(path.join(__dirname, '../templates/register'));
});
router.post('/login', login);
router.get('/login', (req, res, next) => {
  res.render(path.join(__dirname, '../templates/login'));
});
router.post('/logout', logout);
router.get('/logout', (req, res, next) => {
  
});

module.exports = router;