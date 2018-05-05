'use strict';

angular.module('artograph').factory('ArtistFactory', function ($q, $http, GeoFactory) {
  const getAll = () => {
    return $q((resolve, reject) => {
      $http.get(`/artists`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  const getAllByDistance = ({ lat, lng }) => {
    return $q((resolve, reject) => {
      $http.get(`/artists?lat=${lat}&lng=${lng}`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  const getPosts = (insta) => {
    return $q((resolve, reject) => {
      $http.get(`/insta/posts/${insta}`)
        .then(({ data }) => {
          resolve(data);
        })
        .catch(err => reject(err));
    });
  };

  const getRegion = (id) => {
    return $q((resolve, reject) => {
      let region;
      $http.get(`/artists/${id}`)
        .then(({ data }) => {
          if (data.length) data = data[0];
          if (!data.region) {
            let { lat, lng } = data;
            GeoFactory.reverseGeocode({ lat, lng })
              .then(response => {
                if (response) {
                  region = response;
                  $http.patch(`/artists/${id}`, { region })
                    .then(response => {
                      resolve(region);
                    })
                    .catch(err => reject(err));
                } else {
                  resolve('');
                }
              })
              .catch(err => reject(err));
          } else {
            resolve(data.region);
          }
        })
        .catch(err => reject(err));
    });
  };
  return { getAll, getAllByDistance, getPosts, getRegion };
});