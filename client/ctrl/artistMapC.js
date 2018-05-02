'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($scope, GOOGLE, GeolocationFactory, ArtistFactory) {
  GeolocationFactory.geolocate()
    .then(coords => {
      $scope.drawMap({ lat: coords.latitude, lng: coords.longitude });
    })
    .catch(err => console.log(err));

  $scope.drawMap = ({ lat, lng }) => {
    ArtistFactory.getAll()
      .then(artists => {
        let map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: { lat, lng }
        });
        let markers = artists.map(a => {
          let marker = new google.maps.Marker({
            position: { lat: parseFloat(a.lat), lng: parseFloat(a.lng) }
          });
          marker.addListener('click', () => {
            let info = new google.maps.InfoWindow();
            info.setContent(`<h3>${a.name}</h3>`);
            info.open(map, marker);
          });
          return marker;
        });
        let markerCluster = new MarkerClusterer(map, markers, { imagePath: 'img/m' });
      })
  };
});