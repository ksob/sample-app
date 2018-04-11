# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require jquery
#= require jquery_ujs
#= require jquery.fileupload

$ ->
  $('#import_files_form').fileupload
    done: (e, data)->
      $("#import_status").html("Done!")
    start: (e, data)->
      $("#import_status").html("Please wait...")
