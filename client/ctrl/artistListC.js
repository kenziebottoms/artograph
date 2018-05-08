'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, GeoFactory) {

  let geo = { lat: null, lng: null };

  // grab all artists by default
  ArtistFactory.getAll()
    .then(artists => {
      $scope.artists = artists;
    })
    .catch(err => console.log(err));

  // try to geolocate
  GeoFactory.geolocate()
    .then(({ lat, lng }) => {
      geo = { lat, lng };
      ArtistFactory.getAllByDistance(geo)
        .then(artists => {
          $scope.recenterMap(geo);
          $scope.artists = artists;
        })
        .catch(err => console.log(err));
    })
    .catch(err => console.log('No geo available'));

  $rootScope.$on('resortByDistance', (event, { lat, lng }) => {
    ArtistFactory.getAllByDistance({ lat, lng })
      .then(artists => {
        $scope.artists = artists;
      })
      .catch(err => console.log(err));
  });
  $scope.recenterMap = ({ lat, lng }) => {
    $rootScope.$broadcast('recenterMap', { lat, lng });
  };

  // tell ArtistMapCtrl to highlight the clicked artist
  $scope.selectArtist = id => {
    $rootScope.$broadcast('selectArtist', id);
  };
});