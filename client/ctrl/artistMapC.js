'use strict';

angular.module('artograph').controller('ArtistMapCtrl', function ($rootScope, $scope, ArtistFactory) {

  // interprets map clicks as artist selections
  $scope.mapClick = () => {
    if (event.target.tagName == "H5") {
      $scope.expandArtist(event.target.dataset.id);
    }
  };

  // display artist in featured/highlight position under map
  $scope.expandArtist = (id) => {
    if (isNaN(id) || !$scope.highlight || $scope.highlight.id != id) {
      $scope.highlight = null;
      $scope.highlight = _.find($scope.artists, ['id', +id]);
      // get instagram data
      ArtistFactory.getInsta($scope.highlight.insta)
        .then(data => {
          let { followers, posts } = data;
          $scope.highlight.followers = followers;
          $scope.highlight.posts = posts;
          // update follower count in db
          $rootScope.$broadcast("updateArtist", { id, followers });
        })
        .catch(err => console.log(err));
      ArtistFactory.getRegion(id)
        .then(region => {
          $scope.highlight.region = region;
          // update region in db
          $rootScope.$broadcast("updateArtist", { id, region });
        })
        .catch(err => console.log(err));
    } else {
      $scope.highlight = null;
    }
  };

  // refresh map with given artist list, centered on given coords
  $scope.drawMap = (artists, { lat, lng }, zoom) => {
    lat = parseFloat(lat);
    lng = parseFloat(lng);
    // refresh $scope
    $scope.artists = artists;
    // zoom in if there is a non-default epicenter
    if (zoom) $scope.map.setZoom(zoom);
    // recenter on given epicenter
    $scope.map.setCenter({ lat, lng })

    $scope.markers = $scope.getMarkers(artists);

    // clusterize the whole thing
    $scope.markerCluster = new MarkerClusterer($scope.map, $scope.markers, { imagePath: 'img/m' });
    // listen for non-marker clicks
    google.maps.event.addListener($scope.map, 'click', $scope.changeEpicenter);
  };

  // move the epicenter to clicked point
  $scope.changeEpicenter = event => {
    // hide highlighted artist
    $scope.highlight = null;
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

  // $SCOPE VARIABLES

  $scope.star = {
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
  // only one list of markers
  $scope.markers = null;
  // only one map which is altered as needed
  $scope.map = new google.maps.Map(document.getElementById('map'));
  // only one markerCluster which is overwritten when the map is changed (zoom/center, not points)
  $scope.markerCluster = null;
  // one info window that moves to whatever point is clicked
  $scope.info = new google.maps.InfoWindow();
  // only one activeMarker that moves on clicks
  $scope.activeMarker = new google.maps.Marker({ icon: $scope.star, map: $scope.map });

  // turns artist lat/lngs into Google Map Markers with listeners
  $scope.getMarkers = artists => {
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

  // LISTENERS

  // listen for ArtistListCtrl to highlight the clicked artist
  $rootScope.$on('selectArtist', (event, id) => {
    $scope.expandArtist(id);
  });

  // waits for ArtistListCtrl to recenter the map
  $rootScope.$on('recenterMap', (event, { lat, lng }, zoom) => {
    if ($scope.artists) {
      $scope.drawMap($scope.artists, { lat, lng }, zoom);
    } else {
      // eliminates race condition if editing
      ArtistFactory.getAll()
        .then(artists => {
          $scope.artists = artists;
          $scope.drawMap($scope.artists, { lat, lng }, zoom);
        })
        .catch(err => console.log(err));
    }
  });
});