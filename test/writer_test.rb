require './test/test_helper'
require './lib/writer'

class WriterTest < Minitest::Test

  def setup
    @writer = Writer.new
  end

  def test_it_exists
    assert_instance_of Writer, @writer
  end

end
