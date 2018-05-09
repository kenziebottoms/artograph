'use strict';

angular.module('artograph').factory('AuthFactory', function($q, $http, API) {
  module.exports.getActiveUser = () => $http.get(`${API.v1}/user`);
});