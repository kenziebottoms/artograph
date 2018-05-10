'use strict';

angular.module('artograph').controller('AddArtistCtrl', function ($rootScope, $scope, $location, $stateParams, ArtistFactory) {

  $rootScope.mode = 'new';
  $scope.title = `Add new artist`;
  $scope.placeholder = 'High Voltage Tattoo';

  if (!isNaN($stateParams.id)) {
    $scope.mode = 'edit';
    ArtistFactory.getOne(+$stateParams.id)
      .then(artist => {
        $scope.title = `Edit ${artist.name}`
        $scope.placeholder = 'Leave blank if unchanged';
        $scope.newArtist = artist;
        let { lat, lng } = artist;
        $rootScope.$broadcast('recenterMap', {lat, lng}, 8);
      })
      .catch(err => console.log(err));
  }

  // posts form data to API after validating against complete idiocy
  $scope.addArtist = () => {
    // TODO: refactor front-end validation
    if (!$scope.newArtist) return $scope.error = 'Please enter something.';
    let { email, lat, lng, insta, name } = $scope.newArtist;
    if (isNaN(lat) || isNaN(lng)) {
      $scope.error = 'Please search for a location and select it from the dropdown.';
    } else if (!name) {
      $scope.error = 'Please enter a name. If you don\'t know it, enter their Instagram username.';
    } else if (!insta) {
      $scope.error = 'I get that not all artists have an Instagram, but this app kind of depends on it.';
    } else {
      ArtistFactory.create($scope.newArtist)
        .then(response => $location.path('/'))
        .catch(err => console.log(err));
    }
  };

  $scope.saveArtist = () => {
    // TODO: refactor front-end validation
    if (!$scope.newArtist) return $scope.error = 'Please enter something.';
    let { email, lat, lng, insta, name } = $scope.newArtist;
    if (isNaN(lat) || isNaN(lng)) {
      $scope.error = 'Please search for a location and select it from the dropdown.';
    } else if (!name) {
      $scope.error = 'Please enter a name. If you don\'t know it, enter their Instagram username.';
    } else if (!insta) {
      $scope.error = 'I get that not all artists have an Instagram, but this app kind of depends on it.';
    } else {
      ArtistFactory.edit($stateParams.id, $scope.newArtist)
        .then(response => $location.path('/'))
        .catch(err => console.log(err));
    }
  };

  // $SCOPE VARIABLES

  $rootScope.view = 'new';
  // Google Places autocomplete
  $scope.auto = new google.maps.places.Autocomplete(
    (document.getElementById("address"))
  );
  // listener for above
  $scope.auto.addListener('place_changed', function () {
    let place = $scope.auto.getPlace();
    $scope.newArtist.lat = place.geometry.location.lat();
    $scope.newArtist.lng = place.geometry.location.lng();
    $rootScope.$broadcast('recenterMap', {
      lat: $scope.newArtist.lat,
      lng: $scope.newArtist.lng
    }, 9);
  });
});