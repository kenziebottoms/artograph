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
            controller: 'ArtistSearchCtrl',
            templateUrl: 'partials/artistSearch.html'
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
  });