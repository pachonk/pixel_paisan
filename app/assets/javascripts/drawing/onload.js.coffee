$ ->
  $('#painting_application_panel').ready ->

    $('#canvas_size_in_cells_field').val('6')
    $('#cell_size_field').val('25')
    resize_canvas_element()

    $('#palette_selector').trigger('change')

    picture_id = $('#painting_application_panel').data('picture-id')
    if picture_id?
      retrieve_picture_from_server(picture_id)

    $("#painting_canvas").focus()