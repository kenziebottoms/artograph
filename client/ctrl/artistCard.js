'use strict';

angular.module('artograph').controller('ArtistCardCtrl', function ($rootScope, $scope, UserFactory) {
  // tell ArtistMapCtrl to highlight the selected artist
  $scope.selectArtist = id => {
    $rootScope.$broadcast('selectArtist', id);
  };
  $scope.fave = (faveValue, artistId) => {
    if (faveValue) {
      UserFactory.addFave(artistId)
        .then(response => {
          $scope.faves.push(+artistId);
        })
        .catch(err => console.log(err));
    } else {
      UserFactory.removeFave(artistId)
        .then(response => {
          $scope.faves = _.pull($scope.faves, +response);
        })
        .catch(err => console.log(err));
    }
  };
});