'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($rootScope, $scope, ArtistFactory) {

  // $scope variables
  const star = {
    path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
    anchor: new google.maps.Point(130, 150),
    fillColor: 'red',
    fillOpacity: 0.8,
    scale: 0.13,
    strokeColor: 'brown',
    strokeWeight: 1
  };
  $scope.map =  new google.maps.Map(document.getElementById('map'));
  $scope.markerCluster = null;
  // one info window that moves to whatever point is clicked
  $scope.info = new google.maps.InfoWindow();
  $scope.activeMarker = new google.maps.Marker({ icon: star, map: $scope.map });

  // onload
  ArtistFactory.getAll()
    .then(artists => {
      drawMap(artists, { lat: 0, lng: 0 });
    })
    .catch(err => console.log(err));

  const getMarkers = artists => {
    // extract lat/long from artists
    let markers = artists.map(a => {
      let marker = new google.maps.Marker({
        position: { lat: parseFloat(a.lat), lng: parseFloat(a.lng) }
      });
      // add info window listener to each artist point
      marker.addListener('click', () => {
        $scope.info.setContent(`<h5 data-id='${a.id}'>${a.name}</h5>`);
        $scope.info.open($scope.map, marker);
      });
      return marker;
    });
    return markers;
  };

  const drawMap = (artists, { lat, lng }) => {
    // map artist points
    $scope.artists = artists;
    // zoom in if there is a non-default epicenter
    $scope.map.setZoom((lat == 0 && lng == 0) ? 2 : 8);
    // recenter on given epicenter
    $scope.map.setCenter({ lat, lng })

    let markers = getMarkers(artists);
    
    // clusterize the whole thing
    $scope.markerCluster = new MarkerClusterer($scope.map, markers, { imagePath: 'img/m' });
    google.maps.event.addListener($scope.map, 'click', activateMapListeners);
  };

  // listen for non-point clicks
  const activateMapListeners = event => {
      // hide highlighted artist
      selectArtist(null);
      // close all (one) info windows
      $scope.info.close();
      // location of click
      let point = {
        lat: event.latLng.lat(),
        lng: event.latLng.lng()
      };

      // move existing active marker
      $scope.activeMarker.setPosition(point);
      $rootScope.$broadcast('resortByDistance', point);
  };

  const selectArtist = id => {
    $rootScope.$broadcast("highlightArtist", id);
  };

  $scope.mapClick = () => {
    if (event.target.tagName == "H5") {
      selectArtist(event.target.dataset.id);
    }
  };

  $rootScope.$on('recenterMap', (event, { lat, lng }) => {
    $scope.map.setCenter({ lat, lng });
    $scope.map.setZoom(8);
    let markers = getMarkers($scope.artists);
    $scope.markerCluster = new MarkerClusterer($scope.map, markers, { imagePath: 'img/m' });
  });
});