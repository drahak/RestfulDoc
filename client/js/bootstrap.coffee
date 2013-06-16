goog.provide 'Restful.bootstrap'

goog.require 'goog.dom'
goog.require 'Restful'
goog.require 'Restful.AppController'
goog.require 'Restful.ResourceListController'
goog.require 'Restful.ResourceController'
goog.require 'Restful.Doc.ResourceLoader'

###*
  * Restful application entry point
###
Restful.bootstrap = () ->
  rootElement = goog.dom.getDocument()
  angular.element(rootElement).ready () ->
    angular.bootstrap rootElement, ['Restful']
