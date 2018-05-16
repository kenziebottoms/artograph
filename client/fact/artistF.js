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

  // get one artist by id
  const getOne = id => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/artists/${id}`)
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
  const getInsta = (id, insta) => {
    return $q((resolve, reject) => {
      let instaData;
      $http.get(`${API.v1}/insta/${insta}`)
        .then(({ data }) => {
          instaData = data;
          let { followers } = data;
          return $http.patch(`${API.v1}/artists/${id}`, { followers });
        })
        .then(({ data }) => resolve(instaData))
        .catch(err => reject(err));
    });
  };

  // fetch or reverse geocode an artist's region name
  const getRegion = (id) => {
    return $q((resolve, reject) => {
      let region;
      $http.get(`${API.v1}/artists/${id}`)
        .then(({ data }) => {
          if (data.region) return resolve(data.region);
          if (Array.isArray(data)) data = data[0];
          let { lat, lng } = data;
          // only geocodes if region is undefined
          GeoFactory.reverseGeocode({ lat, lng })
            .then(region => {
              if (!region) return reject(region);
              // update stored region
              $http.patch(`${API.v1}/artists/${id}`, { region })
                .then(response => resolve(region))
                .catch(err => reject(err));
            })
            .catch(err => resolve(''));
        })
        .catch(err => reject(err));
    });
  };

  // posts data to patch artist with given id
  const edit = (id, data) => {
    return $q((resolve, reject) => {
      $http.patch(`${API.v1}/artists/${id}`, data)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // post info to a new artist
  const create = data => {
    return $q((resolve, reject) => {
      $http.post(`${API.v1}/artists`, data)
        .then(response => {
          if (response.status != 200) return reject(response);
          let artist = response.data;
          Promise.all([
            getInsta(artist.id, artist.insta),
            getRegion(artist.id)
          ])
            .then(responses => resolve(artist))
            .catch(err => console.log(err));
        })
        .catch(err => reject(err));
    });
  };

  // get all artists that have been tagged with tag
  const getByTag = tag => {
    return $q((resolve, reject) => {
      $http.get(`${API.v1}/artists/tagged/${tag}`)
        .then(({ data }) => resolve(data))
        .catch(err => reject(err));
    });
  };

  // sorts artist list by distance from [lat, lng]
  const sortByDistance = (artists, { lat, lng }) => {
    return _.sortBy(artists, a => Math.sqrt(Math.pow(lat - a.lat, 2) + Math.pow(lng - a.lng, 2)));
  };

  // sort function that alphabetizes by last name
  const compareAlphabetically = (a, b) => {
    a = a.name.split(' ').reverse().join(' ');
    b = b.name.split(' ').reverse().join(' ');
    return a.localeCompare(b);
  };

  const sortAlphabetically = artists => artists.sort(compareAlphabetically);

  return {
    getAll,
    getOne,
    getAllByDistance,
    getInsta,
    getRegion,
    edit,
    create,
    getByTag,
    sortByDistance,
    sortAlphabetically
  };
});