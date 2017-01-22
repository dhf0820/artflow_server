// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

/// Angular js

//= require angular
//= require angular-resource
//= require angular-ui-router
//= require angular-rails-templates
//= require angular-materialize.min
//= require jquery.materialize-autocomplete.min
//= require angular_app
//= require_tree ./templates
//= require_tree ./controllers
//= require_tree ./services


///// require bootstrap-sprockets
//= require materialize
//= require jquery_nested_form
//= require turbolinks
//= require bootstrap-colorselector
/// require_tree .
//= require_self


$(document).ready(function(){
	$('.click').click(function (e) {
		console.log("yes")
	    e.preventDefault();
	    var elem = $(this).parent().parent().next();
        console.log(elem);
	    elem.toggle();
	});

	$(".collap").click(function(){
	  console.log("cime");
	  $(this).parent().parent().parent().parent().collapsible();
	})

	$(".cps").click(function(e){
	  console.log("stop");
	  e.stopPropagation();   	
	});

	//$('select').material_select('destroy');

});
