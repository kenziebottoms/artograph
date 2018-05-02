'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($scope, GOOGLE) {
    $scope.mapScript = `http://maps.google.com/maps/api/js?key=${GOOGLE.apiKey}&libraries=places`;
});