require "./test/test_helper"
require "./lib/data_manager"

class DataManagerTest < Minitest::Test

  def setup
    @input = "message.txt"
    @output = "braille.txt"
    @message = DataManager.new(@input, @output)
  end

  def test_it_exists
    assert_instance_of DataManager, @message
  end

  def test_it_reads_file
    first_text = 'look again'
    assert_equal first_text, @message.file_in[0..9]
  end
  
#### Text to Braille

  def test_output_braille_message
    assert_equal "Created 'braille.txt' containing 704 characters", @message.output_message_writer
  end

  def test_output_braille_file_exists
    @message.write_braille_to_file
    assert File.exist?('./data/braille.txt')
  end

  def test_create_text_lines_of_40_chars
   assert_equal 40, @message.create_lines_of_text[1].size
  end
#### Braille to Text
  def test_output_text_file_exists
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = DataManager.new(input2, output2)
    message2.write_text_to_file
    assert File.exist?('./data/message2.txt')
  end

  def test_output_braille_message
    input2 = "braille.txt"
    output2 = "message2.txt"
    braille_message = DataManager.new(input2, output2)
    assert_equal "Created 'message2.txt' containing 713 characters", braille_message.output_message_reader
  end

  def test_it_groups_braille_lines
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = DataManager.new(input2, output2)
    assert_equal 80, message2.create_braille_lines[0].size
  end

  def test_it_groups_braille_characters
    input2 = "braille.txt"
    output2 = "message2.txt"
    message2 = DataManager.new(input2, output2)
    assert_equal 3, message2.group_braille_characters[0][0].count
  end

end
