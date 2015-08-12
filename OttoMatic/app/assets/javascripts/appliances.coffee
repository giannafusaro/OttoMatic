# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  console.log "HI I'M BEING LOADED!!!"
  $("#new_appliance").on("ajax:success", (e, data, status, xhr) ->
    $("#new_appliance").replaceWith xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_appliance").append "<p>ERROR</p>"
