goog.provide 'Restful'

Restful.module = angular.module 'Restful', ['ui.bootstrap']
Restful.module.value 'bootstrapPath', 'data'
Restful.module.config ($locationProvider, $routeProvider) ->
  $routeProvider.when '/',
    templateUrl: 'js/Restful/views/resource-list.html'

  $routeProvider.when '/resource/:id',
    templateUrl: 'js/Restful/views/resource-detail.html'