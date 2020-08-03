require './test/test_helper'
require './lib/writer'

class WriterTest < Minitest::Test

  def setup
    @writer = Writer.new
  end

  def test_it_exists
    assert_instance_of Writer, @writer
  end

  def test_it_can_write_parts_of_lines
    line = ["m", "o", "m"]

    assert_equal "000.00", @writer.braille_top_line(line)
    assert_equal "...0..", @writer.braille_middle_line(line)
    assert_equal "0.0.0.", @writer.braille_bottom_line(line)
  end

  def test_it_can_write_lines
    line = ["m", "o", "m"]
    assert_equal "000.00\n...0..\n0.0.0.\n", @writer.write_braille_line(line)
  end

end
