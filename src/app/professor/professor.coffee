angular.module("ngBoilerplate.professor", [
  "ui.router"
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

  $stateProvider.state "course",
    url: "/course/:professorId"
    views:
      main:
        controller: "ProfessorCtrl"
        templateUrl: "professor/professor.tpl.html"

    data:
      pageTitle: "Professor"
).controller "ProfessorCtrl", ProfessorCtrl = ($scope, $stateParams, $http) ->
  
  $scope.professorId = $stateParams.professorId
  $http.get('http://ratepoly.scottvanderlind.com/0.1/school/1/instructor/' + $scope.professorId).success((data) ->
      $scope.professor = data.courses
      $scope.firstname = data.firstname
      $scope.lastname  = data.lastname
      $scope.courses   = []

      # Don't show classes without reviews
      for course in data.courses
        if course.reviews.length > 0 then $scope.courses.push(course)

      $scope.parseIntensityRating = (rating) ->
        switch rating
          when "1" then "Cake Walk"
          when "2" then "Minimal Effort"
          when "3" then "Average Effort"
          when "4" then "Substantial Effort"
          when "5" then "Nearly Died"
          else "-"

    $scope.parseDedicationRating = (rating) ->
      switch rating
        when "1" then "Over It"
        when "2" then "Kinda Involved"
        when "3" then "Mostly dedicated"
        when "4" then "Driven"
        when "5" then "Super Stoked"
        else "-"

    $scope.parseComprehensiveRating = (rating) ->
      switch rating
        when "1" then "What!?"
        when "2" then "Confusing"
        when "3" then "Understandable"
        when "4" then "Made it Simple"
        when "5" then "Crystal Clear"
        else "-"
    )

  # This is simple a demo for UI Boostrap.
  $scope.dropdownDemoItems = [
    "The first choice!"
    "And another choice for you."
    "but wait! A third!"
  ]



