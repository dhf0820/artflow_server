angular.module('artApp').factory 'Product', ($resource, $http, $log) ->
  class Product
    constructor: (errorHandler) ->
      @service = $resource('api/products/:id',
        {id: @id},
        update: 
          method: 'PATCH'
        details:
          method: 'GET'
          url: 'api/products/details'
          isArray: false
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
      new @service(product: attrs).$save ( (product) -> successHandler(product) ) ,
        (error) -> 
          errorHandler(error)

    details: (id, successHandler) ->
      @service.details {id: id} , (
        (details) ->
          successHandler(details)
      )

    update: (product,successHandler) ->
      new @service(product: product).$update {id: product.id }, (
        (product) ->
          successHandler(product)
        )

    delete: (product) ->
      new @service().$delete {id: product}
