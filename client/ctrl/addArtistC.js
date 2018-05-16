'use strict';

angular.module('artograph').controller('AddArtistCtrl', function ($rootScope, $scope, $location, $stateParams, ArtistFactory) {

  $rootScope.mode = 'new';

  // if editing, grab artist info
  if (!isNaN($stateParams.id)) {
    $scope.mode = 'edit';
    ArtistFactory.getOne(+$stateParams.id)
      .then(artist => {
        $scope.newArtist = artist;
        let { lat, lng } = artist;
        $rootScope.$broadcast('recenterMap', { lat, lng }, 8);
      })
      .catch(err => console.log(err));
  }

  // posts form data to API after validating against complete idiocy
  $scope.submit = () => {
    // front-end validation
    if (!$scope.newArtist) return $scope.error = 'Please enter something.';
    let { email, lat, lng, insta, name } = $scope.newArtist;
    if (isNaN(lat) || isNaN(lng)) {
      $scope.error = 'Please search for a location and select it from the dropdown.';
    } else if (!name) {
      $scope.error = 'Please enter a name. If you don\'t know it, enter their Instagram username.';
    } else if (!insta) {
      $scope.error = 'I get that not all artists have an Instagram, but this app kind of depends on it.';
    } else {
      // submits data to create or edit artist
      if ($scope.mode == 'edit') {
        ArtistFactory.edit($stateParams.id, $scope.newArtist)
          .then(response => {
            $rootScope.view = 'home';
            $location.path('/');
          })
          .catch(err => $scope.error = err);
      } else if ($scope.mode == 'new') {
        ArtistFactory.create($scope.newArtist)
          .then(response => {
            $rootScope.view = 'home';
            $location.path('/');
          })
          .catch(err => $scope.error = err);
      }
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