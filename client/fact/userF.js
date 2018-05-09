'use strict';

angular.module('artograph').factory('UserFactory', function($q, $http, API) {

  // get currently authenticated user
  const getActiveUser = () => {
    return $http.get(`${API.v1}/user`);
  };

  // get the ids of all the given user's favorite artists
  const getFaves = uid => {
    return $http.get(`${API.v1}/user/${uid}/faves`);
  };

  return {
    getActiveUser,
    getFaves
  }
});