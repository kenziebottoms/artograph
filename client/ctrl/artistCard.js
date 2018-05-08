'use strict';

angular.module('artograph').controller('ArtistCardCtrl', function($rootScope, $scope) {
  // tell ArtistMapCtrl to highlight the selected artist
  $scope.selectArtist = id => {
    $rootScope.$broadcast('selectArtist', id);
  };
});