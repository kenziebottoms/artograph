'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($scope, GOOGLE, GeolocationFactory) {
  GeolocationFactory.geolocate()
    .then(coords => {
      $scope.drawMap({ lat: coords.latitude, lng: coords.longitude });
    })
    .catch(err => console.log(err));

  $scope.drawMap = ({ lat, lng }) => {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: { lat, lng }
    });
  };
});