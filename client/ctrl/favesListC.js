'use strict';

angular.module('artograph').controller('FavesListCtrl', function ($scope, $controller, $location, ArtistFactory, GeoFactory, UserFactory) {

  $controller('ArtistListCtrl', { $scope: $scope });

  // check active user
  $scope.refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => {
        if (user) $scope.user = user;
      })
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };
  
  // IMMEDIATE ACTION

  // grab all artists by default
  UserFactory.getActiveUser()
    .then(user => {
      if (user) {
        UserFactory.getFavoriteArtists(user.id)
          .then(faves => {
            console.log(faves);
            $scope.artists = faves;
          })
          .catch(err => console.log(err));
      }
    })
    .catch(err => $location.path('/'));

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