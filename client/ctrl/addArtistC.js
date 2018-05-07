'use strict';

angular.module('artograph').controller('AddArtistCtrl', function ($rootScope, $scope, $location, ArtistFactory) {
  $scope.auto = new google.maps.places.Autocomplete(
    (document.getElementById("address"))
  );
  $scope.auto.addListener('place_changed', function () {
    let place = $scope.auto.getPlace();
    $scope.newArtist.lat = place.geometry.location.lat();
    $scope.newArtist.lng = place.geometry.location.lng();
    $rootScope.$broadcast('recenterMap', {
      lat: $scope.newArtist.lat,
      lng: $scope.newArtist.lng
    });
  });
  $scope.addArtist = () => {
    ArtistFactory.create($scope.newArtist)
      .then(response => {
        $location.path('/');
      })
      .catch(err => {
        console.log('there was a problem: ', err);
      });
  }
});