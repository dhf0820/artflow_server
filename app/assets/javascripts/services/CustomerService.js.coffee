angular.module('artApp').factory 'Customer', ($resource, $http, $log) ->
  class Customer
    constructor: (errorHandler) ->
      @service = $resource('api/customers/:id',
        {id: @id},
        update: 
          method: 'PATCH'
        search:
          method: 'GET'
          url: 'api/customers/customer_search'
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

    search: (id, successHandler) ->
      @service.search {sage_id: id} , (
        (customer) ->
          successHandler(customer)
      )

    create: (attrs,successHandler,errorHandler) ->
      new @service(customer: attrs).$save ( (customer) -> successHandler(customer) ) ,
        (error) -> 
          errorHandler(error)

    update: (customer,successHandler) ->
      new @service(customer: customer).$update {id: customer.id }, (
        (customer) ->
          successHandler(customer)
        )

    delete: (customer) ->
      new @service().$delete {id: customer}
