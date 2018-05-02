'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($rootScope, $scope, GOOGLE, GeolocationFactory, ArtistFactory) {

  // go ahead and get everybody and draw an empty map
  ArtistFactory.getAll()
    .then(artists => {
      $scope.drawMap(artists, { lat: 0, lng: 0 });
    });

  // then go geolocate;
  GeolocationFactory.geolocate()
    .then(({ lat, lng }) => {
      ArtistFactory.getAllByDistance({ lat, lng })
        .then(artists => {
          $scope.drawMap(artists, { lat, lng });
        })
        .catch(err => console.log(err));
    });

  $scope.drawMap = (artists, { lat, lng }) => {
    $scope.artists = artists;
    let map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: { lat, lng }
    });
    // one info window that moves to whatever point is clicked
    let info = new google.maps.InfoWindow();
    // extract lat/long from artists
    let markers = artists.map(a => {
      let marker = new google.maps.Marker({
        position: { lat: parseFloat(a.lat), lng: parseFloat(a.lng) }
      });
      // add info window listener to each artist point
      marker.addListener('click', () => {
        info.setContent(`<h5 data-id='${a.id}'>${a.name}</h5>`);
        info.open(map, marker);
      });
      return marker;
    });
    // clusterize the whole thing
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
      selectArtist(null);
      info.close();
      let point = {
        lat: event.latLng.lat(),
        lng: event.latLng.lng()
      };

      // move existing active marker
      $scope.activeMarker.setMap(map);
      $scope.activeMarker.setPosition(point);
    });
  };

  const selectArtist = id => {
    $rootScope.$broadcast("highlightArtist", id);
  };

  $scope.mapClick = () => {
    if (event.target.tagName == "H5") {
      selectArtist(event.target.dataset.id);
    }
  };
});