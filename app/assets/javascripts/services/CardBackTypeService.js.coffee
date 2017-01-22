angular.module('artApp').factory 'CardBackType', ($resource, $http, $log) ->
  class CardBackType
    constructor: (errorHandler) ->
      @service = $resource('api/card_back_types/:id',
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
      new @service(card_back_type: attrs).$save ( (card_back_type) -> successHandler(card_back_type) ) ,
        (error) -> 
          errorHandler(error)

    update: (card_back_type,successHandler) ->
      new @service(card_back_type: card_back_type).$update {id: card_back_type.id }, (
        (card_back_type) ->
          successHandler(card_back_type)
        )

    delete: (card_back_type) ->
      new @service().$delete {id: card_back_type}
