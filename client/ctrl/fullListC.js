'use strict';

angular.module('artograph').controller('FullListCtrl', function ($scope, $controller, ArtistFactory, GeoFactory, UserFactory) {

  $controller('ArtistListCtrl', { $scope: $scope });
  
  // check active user
  $scope.refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => {
        if (user) {
          UserFactory.getFaves(user.id)
            .then(faves => $scope.faves = faves)
            .catch(err => console.log(err));
        }
      })
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };

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