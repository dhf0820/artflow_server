angular.module('artApp').factory 'ArtRequest', ($resource, $http, $log) ->
  class ArtRequest
    constructor: (errorHandler) ->
      @service = $resource('api/art_requests/:id',
        {id: @id},
        update: 
          method: 'PATCH'
        )

      @errorHandler = errorHandler
      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    all: ->
      @service.query()

    show: (id, successHandler) ->
      @service.get {id: id}

    create: (attrs,successHandler,errorHandler) ->
      new @service(art_request: attrs).$save ( (art_request) -> successHandler(art_request) ) ,
        (error) -> 
          errorHandler(error)

    update: (art_request,successHandler) ->
      new @service(art_request: art_request).$update {id: art_request.id }, (
        (art_request) ->
          successHandler(art_request)
        )

    delete: (art_request) ->
      new @service().$delete {id: art_request}
