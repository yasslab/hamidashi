require 'minitest/autorun'

class TestHamidashi < Minitest::Test
  def setup
    @hamidashi = Hamidashi.new(1, HAMIDASHI_TEST_PDF)
  end

  def test_overflow?
    overflow_results = 3.times.map { |p| @hamidashi.overflow?(p) }
    assert_equal([false, true, false], overflow_results)
  end

  def test_save_page
    skip
  end

  def test_save_preview_page
    skip
  end
end
