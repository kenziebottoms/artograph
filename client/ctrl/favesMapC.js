'use strict';

angular.module('artograph').controller('FavesMapCtrl', function ($scope, $location, $controller, UserFactory) {

  $controller('ArtistMapCtrl', { $scope: $scope });

  // IMMEDIATE ACTION
  
  // draw map with all artists
  UserFactory.getFavoriteArtists()
    .then(artists => {
      $scope.drawMap(artists, { lat: 0, lng: 0 }, 2);
    })
    .catch(err => $location.path('/'));

});