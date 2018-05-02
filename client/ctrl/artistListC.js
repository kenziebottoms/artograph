'use strict';

angular.module('artograph').controller('ArtistListCtrl', function($scope, ArtistFactory) {
  ArtistFactory.getAll()
    .then(data => {
      $scope.artists = data;
    });
});