angular.module('artApp').factory 'CardJokerType', ($resource, $http, $log) ->
  class CardJokerType
    constructor: (errorHandler) ->
      @service = $resource('api/card_joker_types/:id',
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
      new @service(card_joker_type: attrs).$save ( (card_joker_type) -> successHandler(card_joker_type) ) ,
        (error) -> 
          errorHandler(error)

    update: (card_joker_type,successHandler) ->
      new @service(card_joker_type: card_joker_type).$update {id: card_joker_type.id }, (
        (card_joker_type) ->
          successHandler(card_joker_type)
        )

    delete: (card_joker_type) ->
      new @service().$delete {id: card_joker_type}
