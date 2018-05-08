'use strict';

angular.module('artograph').factory('AuthFactory', function($q, $http) {
  module.exports.getActiveUser = () => $http.get(`/user`);
});