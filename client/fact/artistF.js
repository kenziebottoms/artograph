'use strict';

angular.module('artograph').factory('ArtistFactory', function ($q, $http) {
  const getAll = () => {
    return $http.get(`/artists`)
      .then(({ data }) => data)
  }
  const getAllByDistance = ({ lat, lng }) => {
    return $http.get(`/artists?lat=${lat}&lng=${lng}`)
      .then(({ data }) => data)
  }
  return { getAll, getAllByDistance };
});