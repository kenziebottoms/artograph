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

  // only one list of artists
  $scope.artists = null;
  // only one map which is altered as needed
  $scope.map =  new google.maps.Map(document.getElementById('map'));
  // only one markerCluster which is overwritten when the map is changed (zoom/center, not points)
  $scope.markerCluster = null;
  // one info window that moves to whatever point is clicked
  $scope.info = new google.maps.InfoWindow();
  // only one activeMarker that moves on clicks
  $scope.activeMarker = new google.maps.Marker({ icon: star, map: $scope.map });

  // onload
  ArtistFactory.getAll()
    .then(artists => {
      drawMap(artists, { lat: 0, lng: 0 });
    })
    .catch(err => console.log(err));

  // turns artist lat/lngs into Google Map Markers(R) with listeners
  const getMarkers = artists => {
    return artists.map(a => {
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
  };

  const drawMap = (artists, { lat, lng }) => {
    // refresh $scope
    $scope.artists = artists;
    // zoom in if there is a non-default epicenter
    $scope.map.setZoom((lat == 0 && lng == 0) ? 2 : 8);
    // recenter on given epicenter
    $scope.map.setCenter({ lat, lng })

    let markers = getMarkers(artists);
    
    // clusterize the whole thing
    $scope.markerCluster = new MarkerClusterer($scope.map, markers, { imagePath: 'img/m' });
    // listen for non-marker clicks
    google.maps.event.addListener($scope.map, 'click', changeEpicenter);
  };

  // move the epicenter to clicked point
  const changeEpicenter = event => {
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
      // tell ArtistListCtrl to resort the artists
      $rootScope.$broadcast('resortByDistance', point);
  };

  // tell ArtistListCtrl to highlight the clicked artist
  const selectArtist = id => {
    $rootScope.$broadcast("highlightArtist", id);
  };

  // interprets map clicks as artist selections
  $scope.mapClick = () => {
    if (event.target.tagName == "H5") {
      selectArtist(event.target.dataset.id);
    }
  };

  // waits for ArtistListCtrl to tell it to recenter the map
  $rootScope.$on('recenterMap', (event, { lat, lng }) => {
    $scope.map.setCenter({ lat, lng });
    // zoom in if out
    $scope.map.setZoom(8);
    // rebuild markers in case $scope.artists is different
    let markers = getMarkers($scope.artists);
    // rebuild markerCluster
    $scope.markerCluster = new MarkerClusterer($scope.map, markers, { imagePath: 'img/m' });
  });
});