# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_customer").on("ajax:success", (e, data, status, xhr) ->
    $("#new_customer").replaceWith xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_customer").append "<p>ERROR</p>"

  telem = $('#customer-search.form-element #customer_search.typeahead')
  punkChars = /([^\b\w*\b|\s])/g

  customers = new Bloodhound(
    datumTokenizer: (datum) ->
      return Bloodhound.tokenizers.whitespace datum.value
    queryTokenizer: Bloodhound.tokenizers.nonword
    identify: (obj) -> obj.customer_id
    remote:
      url: "/matching-terms"
      prepare: (query, settings) ->
        settings.url = "/matching-terms?term=#{query.replace(punkChars, '')}"
      transform: (customers) ->
        $.map customers, (customer) ->
          return {
            value: customer.label
            customer_id: customer.customer_id
            address_id: customer.address_id
          }
  )
  # Initialize the Bloodhound suggestion engine
  customers.initialize()

  # Instantiate the Typeahead UI
  telem.typeahead {
    highlight: true
    minLength: 3
    hint: true
  },
    displayKey: 'value'
    source: customers.ttAdapter()
    limit: 20
    templates: {
      footer: Handlebars.compile("<div id='search-new-customer' class='tt-suggestion tt-selectable'><span><i class='fa fa-user-plus'></i> add customer<span></div>")
    }

  telem.bind 'typeahead:select', (ev, suggestion) ->
    telem.data 'customer_id', suggestion.customer_id
    telem.data 'address_id', suggestion.address_id
