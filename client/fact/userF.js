'use strict';

angular.module('artograph').factory('UserFactory', function ($q, $http, API) {

  let notLoggedIn = { status: 401, message: 'You are not logged in.' };
  
  // get currently authenticated user
  const getActiveUser = () => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/user`)
        .then(({ data }) => data ? resolve(data) : reject(notLoggedIn))
        .catch(err => reject(notLoggedIn));
    });
  };

  // get the ids of all the given user's favorite artists
  const getFaves = uid => {
    return $q((resolve, reject) => {
      if (!isNaN(uid)) {
        $http.get(`${API.v1}/user/${uid}/faves`)
          .then(({ data }) => {
            data ? resolve(data.map(d => d.id)) : resolve([]);
          })
          .catch(err => reject(notLoggedIn));
      } else {
        $http.get(`${API.v1}/user/faves`)
          .then(({ data }) => {
            data ? resolve(data.map(d => d.id)) : resolve([]);
          })
          .catch(err => reject(notLoggedIn));
      }
    });
  };

  // get the info of all the given user's favorite artists
  const getFavoriteArtists = () => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/user/faves?verbose=true`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(notLoggedIn));
    });
  };

  const addFave = artistId => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/user/faves/${artistId}`)
        .then(({ data }) => {
          data ? resolve(data) : reject(data);
        })
        .catch(err => reject(err));
    });
  };

  const removeFave = artistId => {
    return $q((resolve, reject) => {
      $http.delete(`${API.v1}/user/faves/${artistId}`)
        .then(({ data }) => data ? resolve(data) : reject(data))
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

  // post to logout
  const logout = () => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/logout`)
        .then(response => resolve(response))
        .catch(err => reject(err));
    });
  };

  return {
    getActiveUser,
    getFaves,
    getFavoriteArtists,
    addFave,
    removeFave,
    login,
    register,
    logout
  };
});