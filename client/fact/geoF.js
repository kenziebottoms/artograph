'use strict';

angular.module('artograph').factory('GeoFactory', function ($q, $http, GOOGLE) {

  // get user's current location, but only wait 1.5s before bailing
  const geolocate = () => {
    return $q((resolve, reject) => {
      if ('geolocation' in navigator) {
        navigator.geolocation.getCurrentPosition(
          // success
          function (p) { resolve({ lat: p.coords.latitude, lng: p.coords.longitude }); },
          // failure
          function (err) { reject(err); },
          // options
          { timeout: 1500 });
      } else {
        reject('Geolocation is not available');
      }
    });
  };

  // reverse geocode given location
  const reverseGeocode = ({lat, lng}) => {
    return $q((resolve, reject) => {
      $http.get(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${GOOGLE.apiKey}`)
        .then(({ data: { results } }) => {
          if (results[0]) {
            let addressComponents = results[0].address_components;
            let state = addressComponents.find(a => a.types.includes('administrative_area_level_1'));
            let country = addressComponents.find(a => a.types.includes('country'));
            if (state && country) {
              resolve(`${state.long_name}, ${country.long_name}`);
            } else {
              resolve('');
            }
          } else {
            reject({status: 'No results or maybe you\'ve over-api\'d.'});
          }
        })
        .catch(err => reject(err));
    });
  };
  return { geolocate, reverseGeocode };
});