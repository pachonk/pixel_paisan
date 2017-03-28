$ ->
  $('#painting_application_panel').ready ->

    picture_id = $('#painting_application_panel').data('picture-id')

    if picture_id
      ColdStorage.get_picture(picture_id)
    else
      Picture.new_picture()
      Picture.set_dimension(25)
      Picture.set_cell_size(14)
      Canvas.resize_canvas_element(Picture.get_dimension(), Picture.get_cell_size())
      Palettes.palette_selector_changed()

    $("#painting_canvas").focus()
