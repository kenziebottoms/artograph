"use strict";

// This module will be executed in server.js.
const bCrypt = require("bcrypt-nodejs");
const passport = require("passport");

const { Strategy } = require("passport-local");
const { generateHash } = require('../../ctrl/authC');

let User = null;

const RegistrationStrategy = new Strategy(
  // arg 1: declare what request (req) fields our usernameField and passwordField (passport variables) are.
  {
    usernameField: "email",
    passwordField: "password",
    passReqToCallback: true // allows us to pass back the entire request to the callback
  },
  // arg2 callback, handle storing a user's details.
  (req, email, password, done) => {
    User = req.app.get("models").User;

    User.findOne({
      where: { email } // remember, this is object literal shorthand. Same as { email: email}
    }).then(user => {
      if (user) {
        return done(null, false, {
          message: "That email is already taken"
        });
      } else {
        const userPassword = generateHash(password);
        const data =
          // values come from the req.body, added by body-parser when register form request is submitted
          {
            email,
            password: userPassword,
            username: req.body.username,
          };
        User.create(data).then(newUser => {
          if (!newUser) {
            return done(null, false);
          }
          if (newUser) {
            return done(null, newUser);
          }
        }).catch(err => console.log(err));
      }
    }).catch(err => console.log(err));
  }
);

const LoginStrategy = new Strategy(
  {
    // by default, local strategy uses username and password, we will override with email
    usernameField: "username",
    passwordField: "password",
    passReqToCallback: true // allows us to pass back the entire request to the callback
  },
  (req, username, password, done) => {
    User = req.app.get("models").User;

    const isValidPassword = (userpass, password) => {
      // hashes the passed-in password and then compares it to the hashed password fetched from the db
      return bCrypt.compareSync(password, userpass);
    };

    User.findOne({ where: { username } })
      .then(user => {
        if (!user) {
          return done(null, false, { message: "Can't find a user with those credentials. Please try again" });
        }
        if (req.body.username != user.username) {
          return done(null, false, {
            message: "Wrong username. Please try again"
          });
        }
        if (!isValidPassword(user.password, password)) {
          return done(null, false, { message: "Incorrect password." });
        }
        const userinfo = user.get(); // get returns the data about the object, separate from the rest of the instance Sequelize gives us after calling 'findOne()' above. Could also have added {raw: true} to the query to achieve the same thing
        return done(null, userinfo);
      })
      .catch(err => {
        return done(null, false, { message: "Something went wrong with your sign in" });
      });
  }
);

//serialize. In this function, we will be saving the user id to the session in req.session.passport.user
passport.serializeUser((user, done) => {
  // This saves the whole user obj into the session cookie, but typically you will see just user.id passed in.
  done(null, user);
});

// deserialize user
// We use Sequelize's findById to get the user. Then we use the Sequelize getter function, user.get(), to pass the user data to the 'done' function as an object, stripped of the sequelize instance methods, etc.
passport.deserializeUser(({ id }, done) => {
  User.findById(id).then(user => {
    if (user) {
      done(null, user.get());
    } else {
      done(user.errors, null);
    }
  });
});

passport.use("local-signup", RegistrationStrategy);
passport.use("local-signin", LoginStrategy);