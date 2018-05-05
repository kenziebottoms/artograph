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
    console.log('getting region');
    return $q((resolve, reject) => {
      let region;
      $http.get(`/artists/${id}`)
        .then(({data}) => {
          console.log(artistDetails);
          if (data.region == "") {
            let { lat, lng } = data;
            console.log('reverse geocoding');
            return GeoFactory.reverseGeocode({ lat, lng });
          } else {
            resolve(region);
          }
        })
        .then(response => {
          if (response) {
            region = response;
            console.log('patching artist');
            return $http.patch(`/artists/${id}`, { region });
          } else {
            resolve('');
          }
        }).then(response => {
          console.log('add region to artist details');
          resolve(region);
        })
        .catch(err => reject(err));
    });
  };
  return { getAll, getAllByDistance, getPosts, getRegion };
});