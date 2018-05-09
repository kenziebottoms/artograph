'use strict';

angular.module('artograph').factory('UserFactory', function($q, $http, API) {

  // get currently authenticated user
  module.exports.getActiveUser = () => {
    return $http.get(`${API.v1}/user`);
  };

  // get the ids of all the given user's favorite artists
  module.exports.getFaves = uid => {
    return $http.get(`${API.v1}/user/${uid}/faves`);
  };
});