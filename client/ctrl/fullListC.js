'use strict';

angular.module('artograph').controller('FullListCtrl', function ($scope, $controller, ArtistFactory, GeoFactory) {

  $controller('ArtistListCtrl', { $scope: $scope });
  
  // IMMEDIATE ACTION

  // grab all artists by default
  ArtistFactory.getAll()
    .then(artists => {
      $scope.artists = artists;
    })
    .catch(err => console.log(err));

  // try to geolocate
  GeoFactory.geolocate()
    .then(({ lat, lng }) => {
      let geo = { lat, lng };
      ArtistFactory.getAllByDistance(geo)
        .then(artists => {
          $scope.recenterMap(geo, 7);
          $scope.artists = artists;
        })
        .catch(err => console.log(err));
    })
    .catch(err => console.log('No geo available'));

  $scope.refreshUser();

});