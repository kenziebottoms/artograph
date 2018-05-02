'use strict';

angular.module('artograph').controller('LoginCtrl', function ($scope, $http, $location) {
  $scope.register = () => {
    let { password, username, confirmation, email } = $scope;
    if (confirmation == password) {
      $scope.error = null;
      $http.post(`/register`, {
        password,
        username,
        email
      })
        .then(response => {
          if (response.status == 200) {
            $location.path('/');
          }
        })
        .catch(err => {
          $scope.error = err.data.message;
        });
    } else {
      $scope.error = 'Your passwords don\'t match.';
    }
  };

  $scope.login = () => {
    let { password, username, confirmation } = $scope;
    if (confirmation == password) {
      $scope.error = null;
      $http.post(`/login`, {
        password,
        username
      })
        .then(response => {
          if (response.status == 200) {
            $scope.error = null;
            $location.path('/');
          } else {
            $scope.error = response.message;
          }
        })
        .catch(err => {
          $scope.error = err.data.message;
        });
    } else {
      $scope.error = 'Your passwords don\'t match.';
    }
  };
});