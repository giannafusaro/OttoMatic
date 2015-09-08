# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_appliance").on("ajax:success", (e, data, status, xhr) ->
    $("#new_appliance").replaceWith xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_appliance").append "<p>ERROR</p>"



  applianceKind = $("#appliance_kind")

  getCommonComplaints = ->
    $.ajax "/common-complaints/#{applianceKind.val()}",
      type: 'GET'
      dataType: 'html'
      error: (jqXHR, textStatus, errorThrown) ->
          console.log 'data', data
          console.log 'textStatus', textStatus
          console.log 'errorThrown', errorThrown
          $('div#common-complaints').html "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
          console.log 'data', data
          console.log 'textStatus', textStatus
          console.log 'jqXHR', jqXHR
          $('div#common-complaints').html data

  applianceKind.change (ev) ->
    ev.preventDefault()
    getCommonComplaints()
    $('.error-message').hide()
