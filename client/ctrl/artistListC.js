'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, GeoFactory, UserFactory) {
  $rootScope.view = 'home';
  $scope.faves = [];

  // tell ArtistMapCtrl to recenter the map on the selected artist
  $scope.recenterMap = ({ lat, lng }, zoom) => {
    $rootScope.$broadcast('recenterMap', { lat, lng }, zoom);
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

  UserFactory.getActiveUser()
    .then(user => UserFactory.getFaves(user.id))
    .then(faves => {
      $scope.faves = faves;
    })
    .catch(err => {
      if (err.status != 401) console.log(err);
    });

  // LISTENERS

  // get updated region from details view
  $rootScope.$on('updateRegion', (event, { id, region }) => {
    $scope.artists.find(a => a.id == id).region = region;
  });

  // resort the artists by distance from new epicenter
  $rootScope.$on('resortByDistance', (event, { lat, lng }) => {
    ArtistFactory.getAllByDistance({ lat, lng })
      .then(artists => {
        $scope.artists = artists;
      })
      .catch(err => console.log(err));
  });

});