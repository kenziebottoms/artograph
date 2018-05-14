'use strict';

angular.module('artograph').controller('NavCtrl', function ($rootScope, $scope, UserFactory) {

  const refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => $scope.user = user)
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };

  // IMMEDIATE ACTION

  refreshUser();

  // LISTENERS

  $rootScope.$on('user change', event => {
    refreshUser();
  });
});