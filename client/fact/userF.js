'use strict';

angular.module('artograph').factory('UserFactory', function ($q, $http, API) {

  // get currently authenticated user
  const getActiveUser = () => {
    return $http.get(`${API.v1}/user`);
  };

  // get the ids of all the given user's favorite artists
  const getFaves = uid => {
    return $http.get(`${API.v1}/user/${uid}/faves`);
  };

  // try to log in with given credentials
  const login = ({ username, password }) => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/login`, {
        password,
        username
      })
        .then(response => {
          if (response.status == 200) {
            resolve(response);
          } else {
            reject(response.message);
          }
        })
        .catch(err => reject(err));
    });
  };

  // try to register with given credentials
  const register = ({ username, password, email }) => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/register`, {
        password,
        username,
        email
      })
        .then(response => {
          if (response.status == 200) {
            resolve(response);
          } else { reject(response); }
        })
        .catch(err => reject(err));
    });
  };

  return {
    getActiveUser,
    getFaves,
    login,
    register
  };
});