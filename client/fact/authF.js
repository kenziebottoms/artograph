'use strict';

angular.module('artograph').factory('AuthFactory', function($q, $http) {
  const getActiveUser = () => $http.get(`/user`);
});