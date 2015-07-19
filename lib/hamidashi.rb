require "hamidashi/version"
require "rmagick"

class Hamidashi
  def initialize(margin, pdf_path)
    @margin   = margin
    @pdf_path = pdf_path
  end

  def overflow?(page)
    cropped_page_img = cropped_img(page)
    colornum         = cropped_page_img.color_histogram.count

    cropped_page_img.destroy!

    expected_colornum != colornum
  end

  def save_page(page, path)
    pdf_image_list[page].write(path)
  end

  def save_preview_page(page, path)
    page_img = pdf_image_list[page].dup

    draw_preview_frame(page).draw(page_img)

    page_img.write(path)

    page_img.destroy!
  end

  def pdf_page_count
    pdf_image_list.count
  end

  private

  # TODO provide a way to set these config values

  def cropped_img(page)
    page_img = pdf_image_list[page]
    x        = right_margin_width(page)
    page_img.crop(page_img.columns - x, 0, x, page_img.rows)
  end

  def draw_preview_frame(page)
    Magick::Draw.new.tap {|draw|
      page_img = pdf_image_list[page]
      draw.fill = 'rgba(0, 255, 0, 50%)'
      draw.stroke_width(0)
      draw.rectangle(page_img.columns - right_margin_width(page), 0, page_img.columns, page_img.rows)
    }
  end

  def expected_colornum
    1
  end

  def fixed_margin?
    @margin.end_with?('px')
  end

  def margin_px
    @margin_width ||= Integer(@margin.sub('px', ''))
  end

  def margin_percentage
    @margin_percentage ||= Rational(@margin.sub('%', '')) / 100
  end

  def pdf_image_list
    @pdf_image_list ||= Magick::ImageList.new(@pdf_path)
  end

  def right_margin_width(page)
    return margin_px if fixed_margin?

    page_img = pdf_image_list[page]
    (page_img.columns * margin_percentage).to_i
  end
end
