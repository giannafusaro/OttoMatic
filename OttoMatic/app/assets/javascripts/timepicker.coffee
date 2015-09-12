$(document).ready ->
  appendToDate = (time) ->
    currInput = $('input#trip_scheduled_for')[0]

    datePattern = ///^([\d]{2})/([\d]{2})/([\d]{4})$///
    date = datePattern.exec currInput.value

    timeSpanPattern = ///^([\d]{1,2})-([\d]{1,2})$///
    times = timeSpanPattern.exec time


    startHour = parseInt(times[1])
    period = if (startHour>6 && startHour<12) then "AM" else "PM"

    currInput.value = date[0] + " #{times[1]}:00#{period}"

  hours = [ 7, 8, 9, 10, 11, 12, 1, 2, 3, 4]
  spans = for hour in hours
    if hour+2<13 then "#{hour}-#{hour+2}" else "#{hour}-#{(hour+2)-12}"

  html = "<div class='gtimepicker-container'><div class='gtimepicker'><table class='times'><tbody>"
  count = 0
  for span in spans
    count = count + 1
    html = html + "<td class='time-spans'>#{span}</td>"
    if count%2==0 then html += "</tr><tr>"
  html += "</tbody></table></div></div>"
  $('#trip-calendar').append html

  $('#trip-calendar .datepicker .table-condensed').on "click", 'td.day', (event) ->
    $('.gtimepicker-container').show()


  $('html').on "click", 'body', (event) ->
    $('.gtimepicker-container').hide()

  $('table.times').on "click", 'td.time-spans', (event) ->
    appendToDate($(this).text())
    $('.gtimepicker-container').hide()
