'use strict';

angular.module('artograph', ['ui.router'])
  .config(($stateProvider) => {
    $stateProvider
      .state('home', {
        url: '/',
        views: {
          '' : {
              templateUrl: 'partials/home.html'
          },
          'map@home': {
            controller: 'ArtistMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'search@home': {
            controller: 'ArtistListCtrl',
            templateUrl: 'partials/artistList.html'
          }
        }
      })
      .state('addArtist', {
        url: '/new',
        views: {
          '' : {
              templateUrl: 'partials/addArtist.html'
          },
          'map@addArtist': {
            controller: 'ArtistMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'addNew@addArtist': {
            controller: 'AddArtistCtrl',
            templateUrl: 'partials/newArtistForm.html'
          }
        }
      })
      .state('register', {
        url: '/register',
        views: {
          '': {
            controller: 'LoginCtrl',
            templateUrl: 'partials/register.html'
          }
        }
      })
      .state('login', {
        url: '/login',
        views: {
          '': {
            controller: 'LoginCtrl',
            templateUrl: 'partials/login.html'
          }
        }
      });
  })
  .config($sceDelegateProvider => {
    $sceDelegateProvider.resourceUrlWhitelist([
      'self',
      'http://*.google.com/**'
    ]);
  });