'use strict';

angular.module('artograph').controller('TagMapCtrl', function ($scope, $controller, $stateParams, ArtistFactory) {

  $controller('ArtistMapCtrl', { $scope: $scope });

  // IMMEDIATE ACTION

  // draw map with all artists
  ArtistFactory.getByTag($stateParams.tag)
    .then(artists => {
      $scope.artists = artists;
      $scope.drawMap(artists, { lat: 0, lng: 0 }, 2);
    })
    .catch(err => console.log(err));

  // LISTENERS
});