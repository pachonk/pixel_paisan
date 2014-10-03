$ ->

  class window.Cell
    constructor: (@x, @y) ->
      @my_fillStyle = "rgba(0, 0, 120, 0)"

    trigger: ->
      target_x = cell_x_to_x ( @x )
      target_y = cell_y_to_y ( @y )
      @my_fillStyle = pp_context.fillStyle
      pp_context.fillRect(target_x, target_y, cell_size(), cell_size())

    redraw: ->
      target_x = cell_x_to_x ( @x )
      target_y = cell_y_to_y ( @y )
      old_fillStyle = pp_context.fillStyle
      pp_context.fillStyle = @my_fillStyle
      pp_context.fillRect(target_x, target_y, cell_size(), cell_size())
      pp_context.fillStyle = old_fillStyle

    clear: () ->
      @my_fillStyle = "rgba(0, 120, 0, 0)"

  cell_x_to_x = (cell_x) ->
    cell_x * cell_size()

  cell_y_to_y = (cell_y) ->
    cell_y * cell_size()