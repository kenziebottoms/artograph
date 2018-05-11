'use strict';

angular.module('artograph').controller('ArtistCardCtrl', function ($rootScope, $scope, $location, UserFactory) {

  // tell ArtistMapCtrl to highlight the selected artist
  $scope.selectArtist = id => {
    $rootScope.$broadcast('selectArtist', id);
  };

  // post favorite or unfavorite to API
  $scope.fave = (faveValue, artistId) => {
    if (faveValue) {
      UserFactory.addFave(artistId)
        .then(response => {
          $scope.faves.push(+artistId);
        })
        .catch(err => $location.path('/login'));
    } else {
      UserFactory.removeFave(artistId)
        .then(response => {
          $scope.faves = _.pull($scope.faves, +response);
        })
        .catch(err => $location.path('/login'));
    }
  };
});