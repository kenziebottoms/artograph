'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, GeoFactory) {
  $rootScope.view = 'home';

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

  // shouters
  // tell ArtistMapCtrl to recenter the map on the selected artist
  $scope.recenterMap = ({ lat, lng }, zoom) => {
    $rootScope.$broadcast('recenterMap', { lat, lng }, zoom);
  };
  // listeners
  // get updated region from details view
  $rootScope.$on('updateRegion', (event, {id, region}) => {
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