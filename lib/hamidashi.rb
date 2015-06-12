require "hamidashi/version"

class Hamidashi
  def てる?(pdf_path, page)
    colornum=`convert -density 92 -geometry #{width} -crop #{crop} "#{pdf_path}[#{page}]" -format %c histogram:info: | wc -l`.to_i
    colornum != expected_colornum
  end

  def てる画像を保存(pdf_path, page, path)
    `convert -density 92 -geometry #{width} "#{pdf_path}[#{page}]" #{path}`
  end

  private

  # TODO 外部から設定出来るようにしたい

  def crop
    "#{crop_width}x+#{width - crop_width}+0"
  end

  def crop_width
    28
  end

  def expected_colornum
    1
  end

  def width
    640
  end
end
