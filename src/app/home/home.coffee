###
Each section of the site has its own module. It probably also has
submodules, though this boilerplate is too simple to demonstrate it. Within
`src/app/home`, however, could exist several additional folders representing
additional modules that would then be listed as dependencies of this one.
For example, a `note` section could have the submodules `note.create`,
`note.delete`, `note.edit`, etc.

Regardless, so long as dependencies are managed correctly, the build process
will automatically take take of the rest.

The dependencies block here is also where component dependencies should be
specified, as shown below.
###

###
Each section or module of the site can also have its own routes. AngularJS
will handle ensuring they are all available at run-time, but splitting it
this way makes each module more "self-contained".
###

###
And of course we define a controller for our route.
###
angular.module("ngBoilerplate.home", [
  "ui.router"
  # "plusOne"
  "ui.bootstrap"
]).config(config = ($stateProvider) ->
  $stateProvider.state "home",
    url: "/home"
    views:
      main:
        controller: "HomeCtrl"
        templateUrl: "home/home.tpl.html"

    data:
      pageTitle: "Home"

).controller "HomeCtrl", HomeController = ($scope, $http, $state) ->
  $scope.onSelect = ($item, $model, $label) ->
    console.log("test")
    $scope.$item = $item
    $scope.$model = $model
    $scope.$label = $label
    if $item.type is "instructor"
      #window.location.href = "#/professor/"+$item.id
      $state.go "professor",
          professorId: $item.id
    else
      $state.go "course",
          professorId: $item.id
  $scope.getLocation = (val) ->
    $http.get("http://ratepoly.scottvanderlind.com/0.1/school/1/search",
      params:
        query: val
    ).then (res) ->
      #console.log res.data
      addresses = []
      angular.forEach res.data.instructors, (item) ->
        addresses.push
          name: item.firstname + " " + item.lastname
          type: "instructor"
          id: item.id
  
      angular.forEach res.data.catalog_courses, (item) ->
        addresses.push
          name: item.catalog
          type: "course"
          id: item.catalog
  
      addresses
