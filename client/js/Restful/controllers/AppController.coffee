goog.provide 'Restful.AppController'

goog.require 'Restful'

class Restful.AppController

  ###*
  * @constructor
  * @param {Object} scope
  * @param {$location} $location
  ###
  constructor: (@$scope, $location) ->

    ###*
    * Is given path current
    * @param {String} path
    ###
    $scope.isCurrent = (path) ->
      path == $location.path()

Restful.AppController.$inject = ['$scope', '$location']

Restful.module.controller 'App', Restful.AppController