'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($rootScope, $scope, GOOGLE, GeolocationFactory, ArtistFactory) {
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
        let info = new google.maps.InfoWindow();
        let markers = artists.map(a => {
          let marker = new google.maps.Marker({
            position: { lat: parseFloat(a.lat), lng: parseFloat(a.lng) }
          });
          marker.addListener('click', () => {
            info.setContent(`<h5 ng-click='selectArtist(${a.id})'>${a.name}</h5>`);
            info.open(map, marker);
          });
          return marker;
        });
        let markerCluster = new MarkerClusterer(map, markers, { imagePath: 'img/m' });

        // you are here star

        let star = {
          path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
          anchor: new google.maps.Point(130, 150),
          fillColor: 'red',
          fillOpacity: 0.8,
          scale: 0.13,
          strokeColor: 'brown',
          strokeWeight: 1
        };
        $scope.activeMarker = new google.maps.Marker({ icon: star });

        // listen for non-point clicks
        google.maps.event.addListener(map, 'click', (event) => {
          $scope.selectArtist(null);
          info.close();
          let point = {
            lat: event.latLng.lat(),
            lng: event.latLng.lng()
          };

          // get rid of existing "You Are Here" marker
          $scope.activeMarker.setMap(map);
          $scope.activeMarker.setPosition(point);
        });
      })
  };

  $scope.selectArtist = id => {
    $rootScope.$broadcast("highlightArtist", id);
  };
});