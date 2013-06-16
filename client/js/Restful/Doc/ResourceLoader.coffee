goog.provide 'Restful.Doc.ResourceLoader'

goog.require 'Restful';

class Restful.Doc.ResourceLoader

  ###*
  * @constructor
  * @param {String} dataPath
  * @param {String} $http
  ###
  constructor: (@bootstrapPath, @$http) ->

  ###*
  * Get resource list
  ###
  loadResourceList: () ->
    @$http.get @bootstrapPath + '/bootstrap.json'

  ###*
  * load resource
  * @param {String} resource file path from data directory
  ###
  loadResource: (resource) ->
    @$http.get(@bootstrapPath + '/' + resource)

Restful.Doc.ResourceLoader.$inject = ['bootstrapPath', '$http']

Restful.module.service 'ResourceLoader', Restful.Doc.ResourceLoader