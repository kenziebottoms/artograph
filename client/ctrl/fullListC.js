'use strict';

angular.module('artograph').controller('FullListCtrl', function ($scope, $controller, UserFactory) {

  $scope.view = 'all';

  $controller('ArtistListCtrl', { $scope: $scope });

  // check active user
  $scope.refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => {
        if (user) {
          UserFactory.getFaves(user.id)
            .then(faves => {
              $scope.faves = faves
            })
            .catch(err => console.log(err));
        }
      })
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };
  $scope.refreshUser();

});