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
      geo = { lat, lng };
      ArtistFactory.getAllByDistance(geo)
        .then(artists => {
          $scope.recenterMap(geo);
          $scope.artists = artists;
        })
        .catch(err => console.log(err));
    })
    .catch(err => console.log('No geo available'));

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
  $scope.recenterMap = ({ lat, lng }) => {
    $rootScope.$broadcast('recenterMap', { lat, lng });
  };
  $scope.expandArtist = id => {
    ArtistFactory.getDetails(id)
      .then(details => {
        $scope.details = details;
        $scope.details.id = id;
      })
      .catch(err => console.log(err));
  };
});