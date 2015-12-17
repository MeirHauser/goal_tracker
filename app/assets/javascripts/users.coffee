# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





$ ->
	$("#projects .row").hover( 
		->$(this).css("background-color", "#28a4c9")
		-> $(this).css("background-color", "white")
	)
$ ->
	$("#categories .row .col-sm-4").hover( 
		->$(this).css("background-color", "#28a4c9")
		-> $(this).css("background-color", "white")
	)
