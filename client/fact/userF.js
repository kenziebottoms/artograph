'use strict';

angular.module('artograph').factory('UserFactory', function ($q, $http, API) {

  // get currently authenticated user
  const getActiveUser = () => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/user`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // get the ids of all the given user's favorite artists
  const getFaves = uid => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/user/${uid}/faves`)
        .then(({ data }) => {
          resolve(data.map(d => d.id));
        })
        .catch(err => reject(err));
    });
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