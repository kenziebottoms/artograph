'use strict';

angular.module('artograph').factory('ArtistFactory', function($q, $http) {
  const getAll = () => {
    return $q((resolve, reject) => {
      $http.get(`/artists`)
        .then(({data}) => {
          resolve(data);
        })
        .catch(err => reject(err));
    });
  }
  return { getAll };
});