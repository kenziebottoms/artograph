'use strict';

angular.module('artograph', ['ui.router'])
  .config(($stateProvider, $urlRouterProvider) => {
    // redirects from / to /#!/
    $urlRouterProvider.when('', '/');
    $stateProvider
      .state('home', {
        url: '/',
        views: {
          '' : {
              templateUrl: 'partials/home.html'
          },
          'map@home': {
            controller: 'FullMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'search@home': {
            controller: 'FullListCtrl',
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
      .state('faves', {
        url: '/faves',
        views: {
          '': {
            templateUrl: 'partials/home.html'
          },
          'map@faves': {
            controller: 'FavesMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'search@faves': {
            controller: 'FavesListCtrl',
            templateUrl: 'partials/artistList.html'
          }
        }
      })
      .state('editArtist', {
        url: '/edit/:id',
        views: {
          '' : {
              templateUrl: 'partials/addArtist.html'
          },
          'map@editArtist': {
            controller: 'ArtistMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'addNew@editArtist': {
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
      })
      .state('tag', {
        url: '/tags/:tag',
        views: {
          '': {
            templateUrl: 'partials/home.html'
          },
          'map@tag': {
            controller: 'TagMapCtrl',
            templateUrl: 'partials/artistMap.html'
          },
          'search@tag': {
            controller: 'TagListCtrl',
            templateUrl: 'partials/artistList.html'
          }
        }
      });
  })
  .config($sceDelegateProvider => {
    $sceDelegateProvider.resourceUrlWhitelist([
      'self',
      '//*.google.com/**'
    ]);
  })
  .constant('API', {
    v1: '/api/v1'
  });