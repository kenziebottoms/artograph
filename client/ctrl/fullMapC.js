'use strict';

angular.module('artograph').controller('FullMapCtrl', function ($scope, $controller, ArtistFactory) {

  $controller('ArtistMapCtrl', { $scope: $scope });

  // IMMEDIATE ACTION

  // draw map with all artists
  ArtistFactory.getAll()
    .then(artists => {
      $scope.artists = artists;
      $scope.drawMap(artists, { lat: 0, lng: 0 }, 2);
    })
    .catch(err => console.log(err));

  // LISTENERS
});