'use strict';

const { Router } = require('express');
const router = Router();
const {
  register,
  login,
  logout,
  checkAuth
} = require('../ctrl/authC');
const path = require('path');

router.get('/user', checkAuth);
router.post('/register', register);
router.post('/login', login);
router.post('/logout', logout);

module.exports = router;