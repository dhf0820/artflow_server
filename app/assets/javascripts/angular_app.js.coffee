artApp = angular.module("artApp",['ngResource','ui.router','templates','ui.materialize'])


artApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common["X-Requested-With"]

artApp.config ($stateProvider) ->
  $stateProvider.state 'art_requests',
    url: ''
    templateUrl: 'art_requests/index.html'
    controller: 'ArtRequestCtrl'
  .state 'artist',
    url: '/artist'
    templateUrl: 'artists/index.html'
    controller: 'ArtistCtrl'

  return

artApp.directive 'addSpec', ->
  restrict: 'A'
  link: ($scope, element , attr) ->
    element.bind 'click' , (event) ->
      $(".new_spec_message").css("display","none")

artApp.directive 'autoComplete', ->
  restrict: 'A'
  link: ($scope, element, attr) ->
    element.bind 'focus', (event) ->
      console.log "Focused ..."
      single = element.materialize_autocomplete(
        multiple: enable: false
        dropdown:
          el: '#singleDropdown'
          itemTemplate: '<li class="ac-item" data-id="<%= item.id %>" data-text=\'<%= item.text %>\'><a href="javascript:void(0)"><%= item.text %></a></li>'
        onSelect: (item) ->
          console.log item.text + ' was selected'
          return
      )
      single.resultCache = $scope.$parent.$parent.customers


artApp.directive 'newSpec', ->
  restrict: 'A'
  scope:
    "spec": "@"

  templateUrl: 'specs/new.html'
  link: ($scope, element , attr, rootScope) ->
    element.bind 'click' , (event) ->
      $scope.$watch 'spec', (newValue, oldValue) ->
        index = $scope.$parent.specIndex
        if newValue.spectype == "face"
          $scope.$parent.face_specs[index] = newValue
        else
          $scope.$parent.back_specs[index] = newValue

artApp.directive 'updateMetField', ->
  restrict: 'A'
  link: ($scope, element , attr) ->
    element.bind 'change' , (event) -> 
      Materialize.updateTextFields()

artApp.directive 'disableExpand', ->
  restrict: 'A'
  link: ($scope, element , attr) ->
    element.bind 'click' , (event) -> 
      console.log("At Disable Expand ...")
      console.log attr
      #event.stopPropagation()

artApp.directive 'dishboardCollapse', ->
  restrict: 'A'
  link: ($scope, element , attr) ->
    element.bind 'click' , (event) -> 
      li = $(element).parent().parent().parent()
      li.attr.disable = "false"
      $(element).parent().parent().parent().collapsible()

artApp.directive 'datePicker', ->
  restrict: 'A'
  link: ($scope, element , attr) ->
    element.bind 'focus' , (event) -> 
      element.pickadate
        selectMonths: true
        selectYears: 15
        onSet: (arg) ->
          if 'select' of arg 
            @close()

artApp.filter 'reverse', ->
  (items) ->
    items.reverse()