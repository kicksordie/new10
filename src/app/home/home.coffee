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
  "ui.state"
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

).controller "HomeCtrl", HomeController = ($scope, $http) ->
  $scope.states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Dakota", "North Carolina", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  $scope.tobedone = "test"
  $scope.getLocation = (val) ->
    return []  if val.toString().length < 2
    $http.get("http://ratepoly.scottvanderlind.com/0.1/school/1/search",
      params:
        query: val
    ).then (res) ->
      console.log res.data
      addresses = []
      angular.forEach res.data.instructors, (item) ->
        addresses.push
          name: item.firstname + " " + item.lastname
          type: "instructor"
  
  
      angular.forEach res.data.catalog_courses, (item) ->
        addresses.push
          name: item.catalog
          type: "course"
  
  
      addresses
