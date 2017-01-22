angular.module('artApp').factory 'SalesRep', ($resource, $http, $log) ->
  class SalesRep
    constructor: (errorHandler) ->
      @service = $resource('api/sales_reps/:id',
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
      new @service(sales_rep: attrs).$save ( (sales_rep) -> successHandler(sales_rep) ) ,
        (error) -> 
          errorHandler(error)

    update: (sales_rep,successHandler) ->
      new @service(sales_rep: sales_rep).$update {id: sales_rep.id }, (
        (sales_rep) ->
          successHandler(sales_rep)
        )

    delete: (sales_rep) ->
      new @service().$delete {id: sales_rep}
