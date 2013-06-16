goog.provide 'Restful.ResourceListController'

goog.require 'Restful'
goog.require 'Restful.Doc.ResourceLoader'

class Restful.ResourceListController

  ###*
  * @constructor
  * @param {Object} scope
  * @param {Restful.Doc.ResourceLoader} ResourceLoader
  ###
  constructor: (@$scope, ResourceLoader) ->
    ResourceLoader.loadResourceList().success (data) ->
      $scope.api = data.v1;

Restful.ResourceListController.$inject = ['$scope', 'ResourceLoader']

Restful.module.controller 'ResourceList', Restful.ResourceListController