'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, GeoFactory, UserFactory) {
  $rootScope.view = 'home';
  $scope.faves = [];

  // tell ArtistMapCtrl to recenter the map on the selected artist
  $scope.recenterMap = ({ lat, lng }, zoom) => {
    $rootScope.$broadcast('recenterMap', { lat, lng }, zoom);
  };

  // check active user
  const refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => {
        if (user) {
          UserFactory.getFaves(user.id)
            .then(faves => $scope.faves = faves)
            .catch(err => console.log(err));
        }
      })
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };

  // IMMEDIATE ACTION

  // grab all artists by default
  ArtistFactory.getAll()
    .then(artists => {
      $scope.artists = artists;
    })
    .catch(err => console.log(err));

  // try to geolocate
  GeoFactory.geolocate()
    .then(({ lat, lng }) => {
      let geo = { lat, lng };
      ArtistFactory.getAllByDistance(geo)
        .then(artists => {
          $scope.recenterMap(geo, 7);
          $scope.artists = artists;
        })
        .catch(err => console.log(err));
    })
    .catch(err => console.log('No geo available'));

    refreshUser();

  // LISTENERS

  // get updated region from details view
  $rootScope.$on('updateArtist', (event, data) => {
    let artist = _.find($scope.artists, ['id', data.id]);
    if (data.region) artist.region = data.region;
    if (data.followers) artist.followers = data.followers;
  });

  // resort the artists by distance from new epicenter
  $rootScope.$on('resortByDistance', (event, { lat, lng }) => {
    ArtistFactory.getAllByDistance({ lat, lng })
      .then(artists => {
        $scope.artists = artists;
      })
      .catch(err => console.log(err));
  });

  // check the active user again
  $rootScope.$on('logout', event => $scope.faves = []);
  
  $rootScope.$on('search', (event, term) => {
    $scope.artistSearch = term;
  });

});