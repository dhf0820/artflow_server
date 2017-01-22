angular.module('artApp').factory 'CardAceType', ($resource, $http, $log) ->
  class CardAceType
    constructor: (errorHandler) ->
      @service = $resource('api/card_ace_types/:id',
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
      new @service(card_ace_type: attrs).$save ( (card_ace_type) -> successHandler(card_ace_type) ) ,
        (error) -> 
          errorHandler(error)

    update: (card_ace_type,successHandler) ->
      new @service(card_face_type: card_ace_type).$update {id: card_ace_type.id }, (
        (card_ace_type) ->
          successHandler(card_ace_type)
        )

    delete: (card_ace_type) ->
      new @service().$delete {id: card_ace_type}
