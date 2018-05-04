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
    if (artistId != null) {
      $scope.expandArtist(artistId);
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
  $scope.expandArtist = (id) => {
    if (!$scope.highlight || $scope.highlight.id != id) {
      $scope.highlight = $scope.artists.find(a => a.id == id);
      let insta = $scope.highlight.insta.split('.com/')[1].trim('/');
      ArtistFactory.getPosts(insta)
        .then(posts => {
          $scope.highlight.posts = posts;
        })
        .catch(err => console.log(err));
    } else {
      $scope.highlight = null;
    }
  };
});