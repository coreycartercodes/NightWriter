require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/file_manager"

class FileManagerTest < Minitest::Test

  def setup
    @input = ARGV[0].chomp
    @output = ARGV[1].chomp
    @read_file = FileManager.new(@input, @output)
  end

  def test_it_exists
    assert_instance_of FileManager, @read_file
  end

  def test_it_reads_file
    first_text = 'Look again'
    assert_equal first_text, @read_file.file_in[0..9]
  end

  def test_output_message
    assert_equal "Created 'braille.txt' containing 593 characters", @read_file.output_message
  end

end
