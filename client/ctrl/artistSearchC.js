'use strict';

angular.module('artograph').controller('ArtistSearchCtrl', function($scope, ArtistFactory) {
  ArtistFactory.getAll()
    .then(data => {
      $scope.artists = data;
    });
});