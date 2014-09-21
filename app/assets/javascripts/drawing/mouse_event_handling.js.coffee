$ ->

  mouse_down = false
  old_mouse_location = null

  $('#canvas').mousedown (e) ->
    mouse_down = true
    old_mouse_location = e
    x = mouse_loc.x(e)
    y = mouse_loc.y(e)
    trigger_cell(x, y)

  $('body').mouseup (e) ->
    mouse_down = false

  $('#canvas').mousemove (e) ->
    if mouse_down
      old_x = mouse_loc.x(old_mouse_location)
      old_y = mouse_loc.y(old_mouse_location)
      old_mouse_location = e
      new_x = mouse_loc.x(e)
      new_y = mouse_loc.y(e)
      brensenham_line_algorithm(old_x, old_y, new_x, new_y)

  brensenham_line_algorithm = (start_x, start_y, end_x, end_y) ->

    current_x = start_x
    current_y = start_y

    delta_x = end_x - start_x
    slope_x = 1
    delta_y = end_y - start_y
    slope_y = 1

    if delta_x < 0
      slope_x = -1
      delta_x = -delta_x

    if delta_y < 0
      slope_y = -1
      delta_y = -delta_y

    delta_x = delta_x << 1
    delta_y = delta_y << 1

    if delta_y < delta_x
      fraction = delta_y - (delta_x>>1)
      while current_x != end_x
        if fraction >= 0
          current_y += slope_y
          fraction -= delta_x
        fraction += delta_y
        current_x += slope_x

        trigger_cell(current_x, current_y)

    else
      fraction = delta_x - (delta_y>>1)
      while current_y != end_y
        if fraction >= 0
          current_x += slope_x
          fraction -= delta_y
        fraction += delta_x
        current_y += slope_y

        trigger_cell(current_x, current_y)