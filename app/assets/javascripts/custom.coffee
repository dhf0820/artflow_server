ready = ->
  $('.form_datetime').datetimepicker
    autoclose: true
    todayBtn: true
    pickerPosition: "bottom-left"
    format: 'dd-mm-yyyy'
    pickTime: false
    minView : 2

$(document).ready(ready)
$(document).on('page:load', ready)
