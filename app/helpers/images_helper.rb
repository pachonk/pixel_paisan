module ImagesHelper
  require 'chunky_png'
  require 'rmagick'
  require 'chunky_png/rmagick'


  def build_png(rgba)
    png_dimension = rgba.size
    png = ChunkyPNG::Image.new(png_dimension, png_dimension, ChunkyPNG::Color::TRANSPARENT)

    rgba.each_with_index do |line, x|
      line.each_with_index do |column, y|
        png[x,y] = build_ChunkyPNG_color(rgba[x][y])
      end
    end
    return png
  end

  def build_ChunkyPNG_color(rgba_obj)
    alpha = alpha_as_255(rgba_obj["a"])
    ChunkyPNG::Color.rgba(rgba_obj["r"], rgba_obj["g"], rgba_obj["b"], alpha)
  end

  def alpha_as_255(a)
    return a*255
  end

  def get_resized_blob(canvas, dimension)
    resized_image = ChunkyPNG::RMagick.export(canvas).scale(dimension, dimension)
    return ChunkyPNG::RMagick.import(resized_image).to_blob({:compression => Zlib::NO_COMPRESSION})
  end

end
