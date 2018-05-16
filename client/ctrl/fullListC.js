'use strict';

angular.module('artograph').controller('FullListCtrl', function ($scope, $controller, ArtistFactory, GeoFactory) {

  $scope.view = 'all';

  $controller('ArtistListCtrl', { $scope: $scope });

  $scope.refreshUser();

  // grab all artists by default
  ArtistFactory.getAll()
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

});