'use strict';

angular.module('artograph').controller('LoginCtrl', function ($rootScope, $scope, $http, $location, UserFactory) {

  // post form info to /api/register
  $scope.register = () => {
    let { password, username, confirmation, email } = $scope;
    if (confirmation == password) {
      $scope.error = null;
      UserFactory.register({ password, username, email })
        .then(response => {
          $rootScope.$broadcast('user change');
          $location.path('/');
        })
        .catch(err => $scope.error = err.data.message);
    } else {
      $scope.error = 'Your passwords don\'t match.';
    }
  };

  // post form info to /api/login
  $scope.login = () => {
    let { password, username } = $scope;
    $scope.error = null;
    UserFactory.login({ username, password })
      .then(response => {
        $scope.error = null;
        $rootScope.$broadcast('user change');
        $location.path('/');
      })
      .catch(err => $scope.error = err.data.message);
  };
});