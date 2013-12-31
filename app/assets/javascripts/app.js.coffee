window.Button = angular.module('Button', ['ngResource'])

Button.config ['$httpProvider', ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]

Button.factory 'Status', ['$resource', ($resource) ->
  $resource '/api/status',
  {},
  'update': method: 'PUT'
]

Button.controller 'ButtonCtrl', ['$scope', 'Status', ($scope, Status) ->
  $scope.status = Status.get()

  $scope.oppositeStatus = ->
    if $scope.status.status == 'off'
      'on'
    else
      'off'

  $scope.click = ->
    $scope.status.status = $scope.oppositeStatus()

    Status.update(
      status: {status: $scope.status.status},
      (results) ->
        console.log results
    )
]
