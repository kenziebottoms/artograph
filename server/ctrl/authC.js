'use strict';
const passport = require('passport');
const bCrypt = require('bcrypt-nodejs');

// return the currently authenticated user
module.exports.getAuthUser = (req, res, next) => {
  if (req.isAuthenticated()) {
    res.status(200).json(req.user);
  } else {
    res.status(200).json(null);
  }
};

// attaches authenticated user to the req
// if there isn't one, return error
module.exports.checkAuthStrict = (req, res, next) => {
  if (req.isAuthenticated()) {
    // req.user is accessible hereafter
    next();
  } else {
    res.status(401).json({
      // 401: Unauthorized
      status: 401,
      message: 'You are not logged in.'
    });
  }
};

// registers and, if successful, logs in
module.exports.register = (req, res, next) => {
  passport.authenticate('local-signup', (err, user, msgObj) => {
    if (err) return next(err);
    if (!user) res.status(409).json({ status: 409, message: msgObj.message });

    // Go ahead and login the new user once they are signed up
    req.logIn(user, err => {
      if (err) return next(err);
      let currentUser = { username: user.username, id: user.id };
      res.status(200).json(currentUser);
    });
  })(req, res, next);
};

// authenticates user
module.exports.login = (req, res, next) => {
  passport.authenticate('local-signin', (err, user, msgObj) => {
    if (err) return next(err);
    if (!user) res.status(401).json({ status: 401, message: msgObj.message });

    req.logIn(user, err => {
      if (err) return next(err);
      res.status(200).json({ username: user.username, id: user.id });
    });
  })(req, res, next);
};

// destroys session
module.exports.logout = (req, res, next) => {
  req.session.destroy(function (err) {
    if (err) return next(err);
    res.sendStatus(200);
  });
};

// passwordifies password
module.exports.generateHash = password => bCrypt.hashSync(password, bCrypt.genSaltSync(8));