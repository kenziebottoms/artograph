'use strict';

const _ = require('lodash');

// sort artists by distance from [lat, lng]
const sortByDistance = (artists, { lat, lng }) => {
  return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
};

// sort function that alphabetizes by last name
const compareAlphabetically = (a, b) => {
  a = a.name.split(' ').reverse().join(' ');
  b = b.name.split(' ').reverse().join(' ');
  return a.localeCompare(b);
};

// middleware that looks for and deals with sorting query params
module.exports = (req, res, next) => {
  // if there is no artists object
  if (!req.artists) return res.status(500).json({
    status: 500,
    message: 'No artists were found.'
  });
  // if lat & lng are defined, sort by distance from [lat, lng]
  if (!isNaN(req.query.lat) && !isNaN(req.query.lng)) {
    return res.status(200).json(sortByDistance(req.artists, req.query));
  }
  // if alphabetical
  if (req.query.sort == 'alpha') {
    return res.status(200).json(req.artists.sort(compareAlphabetically));
  }
  return res.status(200).json(req.artists);
};