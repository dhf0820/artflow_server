ready = ->
  $(".family-selector").on "click", ->
    $(".family-selector").removeClass("btn-primary")
    $(this).addClass("btn-primary")
    return false

  $("#specifications").on "click", ".casino_card_art_request_art_request_specifications_card_side_id", ->
    selected_val = $(this).find("input:checked").val()
    if selected_val == "Face"
      $(".colors").text("Face Color")
      $(this).parent().parent().parent().find(".packaging-type").show()
      $(this).parent().parent().parent().find(".card-edge-type").hide()
    else
      $(".colors").text("Back Color")
      $(this).parent().parent().parent().find(".packaging-type").hide()
      $(this).parent().parent().parent().find(".card-edge-type").show()
    obj = $(this).parent().parent().parent().find(".side-identifier")
    $.get "/art_requests/processing_count?side=" + selected_val, (data)->
      obj.html(selected_val + " ID: P" + data)

  $("#specifications").on "change", ".specification_card_color", ->
    selected_val = $(this).val()
    if selected_val == 'Custom'
      $("#cardColorModal").modal()
      $(".specification_card_color").removeClass('active-color-select')
      $(this).addClass('active-color-select')
    else
      obj = $(this).parent().parent().find(".color-preview")
      $.get "/card_colors/" + $(this).val() + ".json", (data)->
        obj.css("background-color", "rgb(" + data.to_rgb + ")")        

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
