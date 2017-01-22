angular.module('artApp').controller "ArtRequestCtrl", ($scope, $q, $rootScope, $compile, $log, ArtRequest, CardFaceType,CardBackType, CardAceType,CardJokerType,Product, SalesRep, Customer) ->
  $scope.init = -> 
    $log.info("Home Controller ...")
    $scope.specs = []
    $scope.face_specs = []
    $scope.back_specs = []
    $scope.specIndex = 0
    $scope.productDetails()
    $scope.faceTypes()
    $scope.aceTypes()
    $scope.jokerTypes()
    $scope.backTypes()
    $scope.initializeCustomerFields()
    $scope.initializeSpecFields()

    @artRequestService = new ArtRequest()
    $scope.art_requests = @artRequestService.all()
    @salesRepService = new SalesRep()
    $scope.sales_reps = @salesRepService.all()

    @customerService = new Customer()


    $scope.customers = 
      'A': [
        {
          id: 'Abe'
          text: 'Sia "Zirdziņš"'
          highlight: 'Sia "Zirdziņš"'
        }
        {
          id: 'Ari'
          text: 'Ari'
          highlight: '<strong>A</strong>ri'
        }
      ]
      'B': [
        {
          id: 'Abe'
          text: 'Abe'
          highlight: '<strong>A</strong>be'
        }
        {
          id: 'Baz'
          text: 'Baz'
          highlight: '<strong>B</strong>az'
        }
      ]
      'BA': [ {
        id: 'Baz'
        text: 'Baz'
        highlight: '<strong>Ba</strong>z'
      } ]
      'BAZ': [ {
        id: 'Baz'
        text: 'Baz'
        highlight: '<strong>Baz</strong>'
      } ]
      'AB': [ {
        id: 'Abe'
        text: 'Abe'
        highlight: '<strong>Ab</strong>e'
      } ]
      'ABE': [ {
        id: 'Abe'
        text: 'Abe'
        highlight: '<strong>Abe</strong>'
      } ]
      'AR': [ {
        id: 'Ari'
        text: 'Ari'
        highlight: '<strong>Ar</strong>i'
      } ]
      'ARI': [ {
        id: 'Ari'
        text: 'Ari'
        highlight: '<strong>Ari</strong>'
      } ]




    $scope.index = true
    $scope.edit = false
    $scope.new = false
    $scope.cust_search = false


  $scope.initializeSpecFields = ->
    $scope.spec = 
      id: ''
      index: ''
      spectype: ''
      face_type_id: ''
      color: ''
  
  $scope.initializeCustomerFields = ->
    $scope.customer =
      id: ''
      sage_id: ''
      sales_rep_id: ''
      name: ''
      city: ''
      state: ''
      postal_code: ''
      contact_email: ''

  $scope.initializeArtRequestFields = ->
    $scope.art_request =
      id: ''
      product_id: ''
      customer_id: $scope.customer.id
      art_requested_date: ''
      shipment_date: ''
      card_art_request:
        design_id: ''
        card_stock_id: ''
        card_type_id: ''
        card_face_specs: []
        card_back_specs: []


  $scope.productDetails = ->
    @productService = new Product()
    @productService.details $scope.specIndex, ( (details) ->
      $scope.details = details
    )

  $scope.newArtRequest = (customer)-> 
    console.log customer
    console.log("At New art request ...")
    $scope.customer = customer
    $log.warn("creating new art_request")
    $scope.index = false
    $scope.edit = false
    $scope.new = true
    $scope.initializeArtRequestFields()
    $scope.faceTypes()
    $scope.aceTypes()
    $scope.jokerTypes()
    $scope.backTypes()


  $scope.customerSearchForm = ->
    $log.warn("customer search form...")
    $scope.initializeCustomerFields()
    $scope.initializeArtRequestFields()
    $scope.cust_search = true
    $scope.index = false

  $scope.searchCustomer = (cust)->
    $scope.cust_search = true
    $scope.index = false
    @customerService = new Customer()
    @customerService.search cust.sage_id, ( (customer) ->
      console.log "On Search Results .."
      console.log customer
      if customer.id != ''
        $scope.customer = customer
      else
        Materialize.toast("<span> No Customer Found </span>", 2000)
       
    )

  $scope.createCustomer = (customer)->
    if customer.id == ''
      @customerService = new Customer()
      @customerService.create customer , ( (created_customer) ->
        $scope.customer = created_customer
        $scope.cust_search = false
        $scope.index = false
        $scope.newArtRequest($scope.customer)
      ), 
      (error) ->
        $scope.errors = error
    else
      $scope.customer = customer
      $scope.cust_search = false
      $scope.index = false
      $scope.newArtRequest($scope.customer)

  $scope.faceTypes = ->
    @cardFaceTypeService = new CardFaceType()
    $scope.card_face_types = @cardFaceTypeService.all()
    console.log $scope.card_face_types

  $scope.backTypes = ->
    @cardBackTypeService = new CardBackType()
    $scope.card_back_types = @cardBackTypeService.all()
    console.log $scope.card_face_types

  $scope.aceTypes = ->
    @cardAceTypeService = new CardAceType()
    $scope.card_ace_types = @cardAceTypeService.all()
    console.log $scope.card_face_types

  $scope.jokerTypes = ->
    @cardJokerTypeService = new CardJokerType()
    $scope.card_joker_types = @cardJokerTypeService.all()
    console.log $scope.card_face_types

  $scope.addNewSpec = (spec,flag)->
    $scope.specIndex = $scope.specIndex + 1
    $scope.new_spec = true
    compiledeHTML = $compile("<li new_spec></li>")($scope)
    if flag == 'N'
      $(".new_spec").append(compiledeHTML)
    else
      $(".edit_spec").append(compiledeHTML)

  $scope.createArtRequest = (art_request) ->
    art_request = $scope.prepare_attributes(art_request)
    @artRequestService = new ArtRequest()
    @artRequestService.create art_request , ( (created_art_request) ->
      $scope.art_requests.unshift(created_art_request)
      $scope.index = true
      $scope.edit = false
      $scope.new = false
      $scope.cust_search = false
    ), 
    (error) ->
      $scope.errors = error

  $scope.backToIndex = ->
    $scope.index = true
    $scope.edit = false
    $scope.new = false
    $scope.cust_search = false
    $scope.specs = []
    $scope.face_specs = []
    $scope.back_specs = []
    $scope.specIndex = 0
    $scope.initializeCustomerFields()
    $scope.initializeSpecFields()

  $scope.editArtRequest = (art_request) ->
    $scope.art_request = art_request
    $log.log($scope.art_request)
    $scope.edit = true
    $scope.index = false
    $scope.new = false
    $scope.cust_search = false

  $scope.updateArtRequest = (art_request, index) -> 
    art_request = $scope.prepare_attributes(art_request)
    @artRequestService = new ArtRequest()
    @artRequestService.update art_request ,( (updated_art_request) -> 
      $scope.art_requests[index] = updated_art_request
      $scope.createDiv = false
      $scope.indexDiv = true
    ),
    (error) -> 
      $log.error(error)

  $scope.deleteArtRequest = (art_request_id, index) ->
    @artRequestService = new ArtRequest()
    @artRequestService.delete(art_request_id)
    $scope.art_requests.splice(index,1)

  $scope.backtoIndex = -> 
    $scope.createDiv = false
    $scope.indexDiv = true

  $scope.prepare_attributes = (art_request) ->
    hash = {}
    hash['id'] = art_request.id
    hash['product_id'] = art_request.product_id
    hash['customer_id'] = art_request.customer_id
    hash['art_requested_date'] = art_request.art_requested_date
    hash['shipment_date'] = art_request.shipment_date

    hash['card_art_request_attributes'] = {}
    hash['card_art_request_attributes']['design_id'] = art_request.card_art_request.design_id
    hash['card_art_request_attributes']['card_stock_id'] = art_request.card_art_request.card_stock_id
    hash['card_art_request_attributes']['card_type_id'] = art_request.card_art_request.card_type_id
    hash['card_art_request_attributes']['card_face_specs_attributes'] = {}
    hash['card_art_request_attributes']['card_face_specs_attributes'] = $scope.face_specs
    hash['card_art_request_attributes']['card_back_specs_attributes'] = $scope.back_specs

    return hash

