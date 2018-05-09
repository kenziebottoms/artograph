'use strict';

angular.module('artograph').factory('ArtistFactory', function ($q, $http, GeoFactory, API) {

  // get list of all artists
  const getAll = () => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/artists`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // get all artists ordered by distance from [lat, lng]
  const getAllByDistance = ({ lat, lng }) => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/artists?lat=${lat}&lng=${lng}`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // get a user's recent instagram posts
  const getPosts = (insta) => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/insta/posts/${insta}`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // reverse geocode an artist's region name
  const getRegion = (id) => {
    return $q((resolve, reject) => {
      let region;
      $http.get(`${API.v1}/artists/${id}`)
        .then(({ data }) => {
          if (Array.isArray(data)) data = data[0];
          if (!data.region) {
            let { lat, lng } = data;
            GeoFactory.reverseGeocode({ lat, lng })
              .then(response => {
                if (response) {
                  region = response;
                  $http.patch(`${API.v1}/artists/${id}`, { region })
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

  // post info to a new artist
  const create = data => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/artists`, data)
        .then(response => {
          if (response.status == 200) {
            resolve(response);
          } else {
            reject(response);
          }
        })
        .catch(err => reject(err));
    });
  };

  return {
    getAll,
    getAllByDistance,
    getPosts,
    getRegion,
    create
  }
});