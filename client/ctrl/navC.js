'use strict';

angular.module('artograph').controller('NavCtrl', function ($rootScope, $scope, UserFactory) {

  const refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => $scope.user = user)
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };

  $scope.logout = () => {
    UserFactory.logout()
      .then(response => {
        $rootScope.$broadcast('logout');
        $scope.user = null;
      })
      .catch(err => console.log(err));
  };

  $scope.search = (term) => {
    $rootScope.$broadcast('search', term);
  };

  // IMMEDIATE ACTION

  refreshUser();

  // LISTENERS

  $rootScope.$on('user change', event => {
    refreshUser();
  });
});