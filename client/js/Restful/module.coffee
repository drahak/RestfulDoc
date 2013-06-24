goog.provide 'Restful'

Restful.module = angular.module 'Restful', ['ui.bootstrap']
Restful.module.value 'bootstrapPath', 'data'
Restful.module.config ($locationProvider, $routeProvider) ->
  $routeProvider.when '/',
    templateUrl: 'js/Restful/views/list.html'

  $routeProvider.when '/api',
    templateUrl: 'js/Restful/views/api.html'

  $routeProvider.when '/resource/:id',
    templateUrl: 'js/Restful/views/detail.html'