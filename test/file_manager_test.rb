require "./test/test_helper"
require "mocha/minitest"
require "./lib/file_manager"

class FileManagerTest < Minitest::Test

  def setup
    @input = ARGV[0].chomp
    @output = ARGV[1].chomp
    @message = FileManager.new(@input, @output)
  end

  def test_it_exists
    assert_instance_of FileManager, @message
  end

  def test_it_reads_file
    first_text = 'Look again'
    assert_equal first_text, @message.file_in[0..9]
  end

  def test_output_message
    assert_equal "Created 'braille.txt' containing 593 characters", @message.output_message
  end

  def test_output_file_exists
    @message.output_file
    assert File.exists?('./textfiles/braille.txt')
  end

end
