$(document).ready ->
    $('#datetimepicker').datetimepicker
      language: 'en',
      pageLocation: '#trip-calendar'
      pick12HourFormat: true,
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
      sideBySide: true,
      daysOfWeekDisabled: [0, 6],
      enabledHours: [8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
      stepping: 60,
      useMinutes: false


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
        viewMode: 'months'

    $('#datepicker').data("DateTimePicker").widget.hide()
