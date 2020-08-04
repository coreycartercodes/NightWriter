require './lib/writer'

class DataManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./data/#{input}").downcase
    @output_file = output
    @writer = Writer.new
  end

  #### Text to Braille
  def output_message_writer
    "Created '#{@output_file}' containing #{@file_in.chars.count} characters"
  end

  def create_lines_of_text
    text = @file_in
    lines = []
    while text.chars.length >= 40
      new_line = text.split("",41)
      text = new_line.pop
      lines << new_line
    end
    lines << text.split("")
  end

  def create_braille_output_file_data
    output_file_data = ""
    create_lines_of_text.each do |line|
      output_file_data << @writer.write_braille_line(line)
    end
    output_file_data
  end

  def write_braille_to_file
    File.write("./data/#{@output_file}", create_braille_output_file_data)
  end

  #### Braille to Text
  def output_message_reader
    "Created '#{@output_file}' containing #{(@file_in.chars.count)/6} characters"
  end

  def create_braille_lines
    braille_lines = @file_in.split("\n")
  end

  def group_braille_lines
    braille_lines = create_braille_lines
    grouped_lines = []
    while braille_lines.size > 0
      line = []
      3.times do
        new_line = braille_lines.shift
        line << new_line
      end
      grouped_lines << line
    end
    grouped_lines
  end

  def collect_braille_chars_by_position
    group_by_char = group_braille_lines.each do |group|
      top << group[0].scan(/(..)/)
      middle << group[1].scan(/(..)/)
      bottom << group[2].scan(/(..)/)
    end
  end

  def group_braille_characters
    top = []
    middle = []
    bottom = []
    collect_braille_chars_by_position
    characters = []
    top.each_with_index do |group, index|
      characters << group.zip(middle[index], bottom[index])
    end
    characters
  end

  def create_output_file_data
    output_file_data = @writer.write_braille_string(group_braille_characters)
  end

  def write_text_to_file
    File.write("./data/#{@output_file}", create_output_file_data)
  end

end
