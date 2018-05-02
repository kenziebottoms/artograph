'use strict';

angular.module('artograph').factory('GeolocationFactory', function($q, $http) {
  const geolocate = () => {
    return $q((resolve, reject) => {      
      if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(function(p) {
          resolve(p.coords);
        });
      } else {
        reject("Geolocation is not available");
      }
    });
  };
  return { geolocate };
});