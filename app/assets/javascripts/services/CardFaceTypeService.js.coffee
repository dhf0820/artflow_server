angular.module('artApp').factory 'CardFaceType', ($resource, $http, $log) ->
  class CardFaceType
    constructor: (errorHandler) ->
      @service = $resource('api/card_face_types/:id',
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
      new @service(card_face_type: attrs).$save ( (card_face_type) -> successHandler(card_face_type) ) ,
        (error) -> 
          errorHandler(error)

    update: (card_face_type,successHandler) ->
      new @service(card_face_type: card_face_type).$update {id: card_face_type.id }, (
        (card_face_type) ->
          successHandler(card_face_type)
        )

    delete: (card_face_type) ->
      new @service().$delete {id: card_face_type}
