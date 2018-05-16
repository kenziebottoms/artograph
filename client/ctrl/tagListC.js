'use strict';

angular.module('artograph').controller('TagListCtrl', function ($scope, $controller, $location, $stateParams, ArtistFactory, GeoFactory) {

  $scope.view = 'tags';
  $scope.tag = $stateParams.tag;

  $controller('ArtistListCtrl', { $scope: $scope });

  // IMMEDIATE ACTION

  ArtistFactory.getByTag($stateParams.tag)
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