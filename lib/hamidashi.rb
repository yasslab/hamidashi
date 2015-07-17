require "hamidashi/version"
require "shellwords"

class Hamidashi
  def initialize(percentage, pdf_path)
    @crop_width = (width * percentage / 100).to_i
    @pdf_path   = pdf_path
  end

  def overflow?(page)
    colornum=`convert -density 92 -geometry #{width} -crop #{crop} "#{@pdf_path.shellescape}[#{page.to_s.shellescape}]" -format %c histogram:info: | wc -l`.to_i
    colornum != expected_colornum
  end

  def save_page(page, path)
    `convert -density 92 -geometry #{width} "#{@pdf_path.shellescape}[#{page.to_s.shellescape}]" #{path.shellescape}`
  end

  def save_preview_page(page, path)
    `convert -density 92 -geometry #{width} -fill "rgba(0, 255, 0, 50%)" -strokewidth 0 -draw "rectangle #{width - crop_width},#{height},#{width},0" "#{@pdf_path.shellescape}[#{page.to_s.shellescape}]" #{path.shellescape}`
  end

  private

  # TODO provide a way to set these config values

  def crop
    "#{crop_width}x+#{width - crop_width}+0"
  end

  def crop_width
    @crop_width
  end

  def expected_colornum
    1
  end

  # FIXME
  def height
    10000
  end

  def width
    640
  end
end
