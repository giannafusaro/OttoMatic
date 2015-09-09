# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  gon.watch
  zips = gon.zip_codes

  $('.address_zipcode').keyup (ev) ->
    if $(this).val().length == 0
      $('.address_city').val("")

  substringMatcher = (strs) ->
    (q, cb) ->
      matches = undefined
      substringRegex = undefined
      # an array that will be populated with substring matches
      matches = []
      # regex used to determine if a string contains the substring `q`
      substrRegex = new RegExp(q, 'i')
      # iterate through the pool of strings and for any string that
      # contains the substring `q`, add it to the `matches` array
      $.each strs, (i, str) ->
        if substrRegex.test(str)
          matches.push str
      $('.address_city').val(gon.cities[matches[0]])
      cb matches

  $('.form-element .typeahead.zip-code').typeahead {
  hint: true
  highlight: true
  minLength: 1
  },
  name: 'zips'
  source: substringMatcher(zips)
