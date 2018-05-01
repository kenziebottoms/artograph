'use strict';

const { Router } = require('express');
const router = Router();
const {
  register,
  login,
  logout
} = require('../ctrl/auth');

router.post('/register', register);
router.get('/register', (req, res, next) => {

});
router.post('/login', login);
router.get('/login', (req, res, next) => {
  
});
router.post('/logout', logout);
router.get('/logout', (req, res, next) => {
  
});

module.exports = router;