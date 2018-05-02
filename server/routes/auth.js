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
router.post('/login', login);
router.post('/logout', logout);

module.exports = router;