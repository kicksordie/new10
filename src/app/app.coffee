angular.module("ngBoilerplate", [
  "templates-app"
  "templates-common"
  "ngBoilerplate.home"
  "ngBoilerplate.professor"
  "ngBoilerplate.course"
  "ui.router"
  "ui.route"
  "ui.bootstrap"
]).config(myAppConfig = ($stateProvider, $urlRouterProvider, $httpProvider, $locationProvider) ->

  # Enable cross domain calls
  $httpProvider.defaults.useXDomain = true
  # Remove the header used to identify ajax call  that would prevent CORS from working
  delete $httpProvider.defaults.headers.common['X-Requested-With']

  $urlRouterProvider.otherwise "/home"
).run(run = ->
).controller "AppCtrl", AppCtrl = ($scope, $location) ->
  $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    if angular.isDefined(toState.data.pageTitle)
      $scope.pageTitle = toState.data.pageTitle + " | ngBoilerplate"
