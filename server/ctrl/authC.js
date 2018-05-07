'use strict';
const passport = require('passport');
const bCrypt = require('bcrypt-nodejs');

module.exports.register = (req, res, next) => {
  // first argument is name of the passport strategy we created in passport-strat.js
  passport.authenticate('local-signup', (err, user, msgObj) => {

    if (err) return next(err);

    if (!user) {
      console.log('Error registering', msgObj.message);
      res.status(409); // Conflict. This code is debatable
      res.json({ message: msgObj.message });
    }

    // Go ahead and login the new user once they are signed up
    req.logIn(user, err => {
      if (err) {
        return next(err);
      }
      console.log('authenticated!', user);
      let currentUser = { username: user.username, id: user.id };
      res.status(200).json(currentUser);
    });
  })(req, res, next);
};

module.exports.login = (req, res, next) => {
  passport.authenticate('local-signin', (err, user, msgObj) => {
    // If login fails, the error is sent back by the passport strategy as { message: 'some msg'}
    console.log('error msg?', msgObj);
    if (err) {
      return next(err);
    }
    if (!user) {
      // (Unauthorized status code
      res.status(401);
      res.json({ message: msgObj.message });
    }

    req.logIn(user, err => {
      if (err) return next(err);
      res.status(200).json({ username: user.username, id: user.id });
    });
  })(req, res, next);
};

// logging out
module.exports.logout = (req, res, next) => {
  req.session.destroy(function (err) {
    if (err) return next(err);
    res.status(200).end();
  });
};


// add our hashed password generating function inside the callback function
module.exports.generateHash = password => {
  let hashedWord = bCrypt.hashSync(password, bCrypt.genSaltSync(8));
  console.log('hashedWord', hashedWord);

  return hashedWord;
};