ready = ->
  $("#art_request_customer_id").on "keyup", ->
    $.get "/customers/details?sage_id="+ $("#art_request_customer_id").val(), (result)->
      if result != null
        details = result.name + "\n" + result.address1 + "\n" + result.address2 + "\n" + result.address3
        $("#art_request_customer_details").val(details)
        $("#art_request_customer_name").val(result.contact_name)
        $("#art_request_customer_phone").val(result.contact_phone)
        $("#art_request_customer_email").val(result.contact_email)

$(document).ready(ready)
$(document).on('page:load', ready)
