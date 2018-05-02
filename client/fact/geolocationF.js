'use strict';

angular.module('artograph').factory('GeolocationFactory', function ($q, $http) {
  const geolocate = () => {
    return $q((resolve, reject) => {
      if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(function (p) {
          resolve({ lat: p.coords.latitude, lng: p.coords.longitude });
        });
      } else {
        reject("Geolocation is not available");
      }
    });
  };
  return { geolocate };
});