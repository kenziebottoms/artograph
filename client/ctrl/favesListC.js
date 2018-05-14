'use strict';

angular.module('artograph').controller('FaveListCtrl', function ($scope, $controller) {
  $controller('ArtistListCtrl', { $scope: $scope });
});