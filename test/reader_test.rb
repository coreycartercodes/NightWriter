require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/reader"

class ReaderTest < Minitest::Test

  def setup
    @input = ARGV[0].chomp
    @output = ARGV[1].chomp
    @read_file = Reader.new(@input, @output)
  end

  def test_it_exists
    assert_instance_of Reader, @read_file
  end

  def test_it_reads_file
    

  end

end
