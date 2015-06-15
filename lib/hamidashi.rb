require "hamidashi/version"
require "shellwords"

class Hamidashi
  def initialize(percentage)
    @crop_width = (width * percentage / 100).to_i
  end

  def overflow?(pdf_path, page)
    colornum=`convert -density 92 -geometry #{width} -crop #{crop} "#{pdf_path.shellescape}[#{page.shellescape}]" -format %c histogram:info: | wc -l`.to_i
    colornum != expected_colornum
  end

  def save_page(pdf_path, page, path)
    `convert -density 92 -geometry #{width} "#{pdf_path.shellescape}[#{page.shellescape}]" #{path.shellescape}`
  end

  def save_preview_page(pdf_path, page, path)
    `convert -density 92 -geometry #{width} -fill "rgba(0, 255, 0, 50%)" -strokewidth 0 -draw "rectangle #{width - crop_width},#{height},#{width},0" "#{pdf_path.shellescape}[#{page.shellescape}]" #{path.shellescape}`
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
