'use strict';

angular.module('artograph').factory('ArtistFactory', function ($q, $http) {
  const getAll = () => {
    return $q((resolve, reject) => {
      $http.get(`/artists`)
        .then(({data}) => resolve(data))
        .catch(err => reject(err));
    });
  };
  const getAllByDistance = ({ lat, lng }) => {
    return $q((resolve, reject) => {
      $http.get(`/artists?lat=${lat}&lng=${lng}`)
      .then(({data}) => resolve(data))
        .catch(err => reject(err));
    });
  };
  const getDetails = id => {
    return $q((resolve, reject) => {
      Promise.all([
        $http.get(`/artists/${id}`),
        $http.get(`/artists/${id}/tags`)
      ])
        .then(([details, tags]) => {
          details = details.data;
          details.tags = tags.data;
          resolve(details);
        })
        .catch(err => reject(err));
    });
  };
  return { getAll, getAllByDistance, getDetails };
});