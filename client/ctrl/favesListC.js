'use strict';

angular.module('artograph').controller('FavesListCtrl', function ($scope, $controller, $location, ArtistFactory, GeoFactory, UserFactory) {

  $scope.view = 'faves';

  $controller('ArtistListCtrl', { $scope: $scope });

  // IMMEDIATE ACTION

  // grab all artists by default
  UserFactory.getFavoriteArtists()
    .then(artists => {
      $scope.artists = ArtistFactory.sortAlphabetically(artists);
      // try to geolocate
      GeoFactory.geolocate()
        .then(({ lat, lng }) => {
          let geo = { lat, lng };
          ArtistFactory.sortByDistance($scope.artists, geo)
            .then(artists => {
              $scope.recenterMap(geo, 7);
              $scope.artists = artists;
            })
            .catch(err => console.log(err));
        })
        .catch(err => {});
    })
    .catch(err => console.log(err));

  $scope.refreshUser();
});