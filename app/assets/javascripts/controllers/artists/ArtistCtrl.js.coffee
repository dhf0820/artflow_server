angular.module('artApp').controller "ArtistCtrl", ($scope, $q, $rootScope, $compile, $log, ArtRequest, CardFaceType,CardBackType, CardAceType,CardJokerType,Product, SalesRep, Customer) ->
  $scope.init = -> 
    console.log "Artist Controller"
    $scope.message = "HELLO"

