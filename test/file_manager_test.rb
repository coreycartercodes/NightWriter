require "./test/test_helper"
require "./lib/file_manager"

class FileManagerTest < Minitest::Test

  def setup
    @input = "message.txt"
    @output = "braille.txt"
    @message = FileManager.new(@input, @output)
  end

  def test_it_exists
    assert_instance_of FileManager, @message
  end

  def test_it_reads_file
    first_text = 'look again'
    assert_equal first_text, @message.file_in[0..9]
  end

  def test_output_braille_message
    assert_equal "Created 'braille.txt' containing 590 characters", @message.output_message_text_in
  end

  def test_output_braille_file_exists
    @message.write_braille_to_file
    assert File.exists?('./data/braille.txt')
  end

  def test_create_text_lines_of_40_chars
   assert_equal 40, @message.create_lines_of_text[1].size
  end

  def test_create_braille_lines_of_80_chars
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = FileManager.new(input2, output2)
   assert_equal 80, message2.create_lines_of_braille[1].size
  end

  def test_output_text_file_exists
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = FileManager.new(input2, output2)
    message2.write_text_to_file
    assert File.exists?('./data/message2.txt')
  end

  def test_output_braille_message
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = FileManager.new(input2, output2)
    assert_equal "Created 'message2.txt' containing 590 characters", message2.output_message_text_in
  end

end
