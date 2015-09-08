$(document).ready ->
  $("a.complaint-tag").click (ev) ->
    ev.preventDefault()
    addComplaintToTrip()
