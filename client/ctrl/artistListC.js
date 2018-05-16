'use strict';

angular.module('artograph').controller('ArtistListCtrl', function ($rootScope, $scope, ArtistFactory, UserFactory) {
  $rootScope.view = 'home';
  $scope.faves = [];

  // tell ArtistMapCtrl to recenter the map on the selected artist
  $scope.recenterMap = ({ lat, lng }, zoom) => {
    $rootScope.$broadcast('recenterMap', { lat, lng }, zoom);
  };

  // check active user
  $scope.refreshUser = () => {
    UserFactory.getActiveUser()
      .then(user => {
        if (user) {
          UserFactory.getFaves(user.id)
            .then(faves => {
              $scope.faves = faves
            })
            .catch(err => console.log(err));
        }
      })
      .catch(err => {
        if (err.status != 401) console.log(err);
      });
  };

  // LISTENERS

  // get updated region from details view
  $rootScope.$on('updateArtist', (event, data) => {
    let artist = _.find($scope.artists, ['id', +data.id]);
    if (artist) {
      if (data.region) artist.region = data.region;
      if (data.followers) artist.followers = data.followers;
    }
  });

  // resort the artists by distance from new epicenter
  $rootScope.$on('resortByDistance', (event, { lat, lng }) => {
    $scope.artists = ArtistFactory.sortByDistance($scope.artists, { lat, lng });
  });

  // check the active user again
  $rootScope.$on('logout', event => $scope.faves = []);

  $rootScope.$on('search', (event, term) => {
    $scope.artistSearch = term;
  });

});