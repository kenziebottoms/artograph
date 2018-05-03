'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, GeolocationFactory) {

  let geo = { lat: null, lng: null };

  // grab all artists by default
  ArtistFactory.getAll()
    .then(artists => {
      $scope.artists = artists;
    })
    .catch(err => console.log(err));

    // try to geolocate
  GeolocationFactory.geolocate()
    .then(({ lat, lng }) => {
      geo = { lat: parseFloat(lat), lng: parseFloat(lng) };
      ArtistFactory.getAllByDistance(geo)
        .then(artists => {
          $rootScope.$broadcast('recenterMap', geo);
          $scope.artists = artists;
        })
        .catch(err => console.log(err));
    })
    .catch(err => console.log('No geo availabe', err));

  $rootScope.$on('highlightArtist', (event, artistId) => {
    if (artistId >= 0) {
      $scope.highlight = $scope.artists.find(a => a.id == artistId);
    } else {
      $scope.highlight = null;
    }
  });
  $rootScope.$on('resortByDistance', (event, { lat, lng }) => {
    ArtistFactory.getAllByDistance({ lat, lng })
      .then(artists => {
        $scope.artists = artists;
      })
      .catch(err => console.log(err));
  });

});