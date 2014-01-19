angular.module("ngBoilerplate.professor", [
  "ui.state"
  "placeholders"
#  "ui.bootstrap"
]).config(config = ($stateProvider) ->
  $stateProvider.state "professor",
    url: "/professor/:professorId"
    views:
      main:
        controller: "ProfessorCtrl"
        templateUrl: "professor/professor.tpl.html"

    data:
      pageTitle: "Professor"

).controller "ProfessorCtrl", ProfessorCtrl = ($scope, $stateParams, $http) ->
  
  $scope.professorId = $stateParams.professorId
  $http.get('http://ratepoly2.scottvanderlind.com/0.1/school/1/instructor/' + $scope.professorId).success((data) ->
      $scope.professor = data.courses
      $scope.firstname = data.firstname
      $scope.lastname  = data.lastname
      $scope.courses   = data.courses
    )

  # This is simple a demo for UI Boostrap.
  $scope.dropdownDemoItems = [
    "The first choice!"
    "And another choice for you."
    "but wait! A third!"
  ]

