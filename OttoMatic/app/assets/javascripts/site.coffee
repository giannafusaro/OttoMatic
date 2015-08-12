$(document).ready ->
    $('#datetimepicker').datetimepicker
      language: 'en',
      pageLocation: '#trip-calendar',
      icons: {
            time: 'fa fa-hourglass-half'
            date: 'fa fa-calendar'
            up: 'fa fa-chevron-up'
            down: 'fa fa-chevron-down'
            previous: 'fa fa-chevron-left'
            next: 'fa fa-chevron-right'
            today: 'fa fa-smile-o'
            clear: 'fa fa-trash'
            close: 'fa fa-times'
      },
      daysOfWeekDisabled: [0, 6],
      useMinutes: false,
      pickTime: false,
      keepOpen: true,
      showClose: true,
      useCurrent: false,
      posOfWidget: 'toLeft'


    $('#datepicker').datetimepicker
      language: 'en',
      pageLocation: '#dop-calendar',
      icons: {
            time: 'fa fa-hourglass-half'
            date: 'fa fa-calendar'
            up: 'fa fa-chevron-up'
            down: 'fa fa-chevron-down'
            previous: 'fa fa-chevron-left'
            next: 'fa fa-chevron-right'
            today: 'fa fa-smile-o'
            clear: 'fa fa-trash'
            close: 'fa fa-times'
      },
      useMinutes: false,
      pickTime: false,
      viewMode: 'months',
      showClose: true,
      posOfWidget: 'toRight'
    $('#datepicker').data("DateTimePicker").widget.hide()
    $('#datetimepicker').data("DateTimePicker").widget.hide()
