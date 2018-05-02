'use strict';

angular.module('artograph').controller('ArtistListCtrl', function($rootScope, $scope, ArtistFactory) {

  ArtistFactory.getAll()
    .then(data => {
      $scope.artists = data;
    });

  $rootScope.$on('highlightArtist', (event, artistId) => {
    if (artistId >= 0) {
      $scope.highlight = $scope.artists.find(a => a.id == artistId);
    } else {
      $scope.highlight = null;
    }
  });

});