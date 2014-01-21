angular.module("ngBoilerplate.submit", [
  "ui.router"
  "placeholders"
#  "ui.bootstrap"
]).config(config = ($stateProvider) ->
  $stateProvider.state "submit",
    url: "/submit"
    views:
      main:
        controller: "SubmitCtrl"
        templateUrl: "submit/submit.tpl.html"

    data:
      pageTitle: "Submit"

).controller "SubmitCtrl", SubmitCtrl = ($scope, $stateParams, $http) ->

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
   
