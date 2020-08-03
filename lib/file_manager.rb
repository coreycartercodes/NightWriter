require './lib/writer'

class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./data/#{input}").downcase
    @output = output
    @writer = Writer.new
  end

  #### Text to Braille
  def output_message_text_in
    output_characters_braille = @file_in.chars.count
    "Created '#{@output}' containing #{output_characters_braille} characters"
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
    lines
  end

  def write_braille_to_file
    output_file_data = ""
    create_lines_of_text.each do |line|
      output_file_data << @writer.write_braille_line(line)
    end
    File.write("./data/#{@output}", output_file_data)
  end

  #### Braile to Text
  def output_message_braille_in
    file_length = @file_in.chars.count
    output_numbers = file_length/6
    "Created '#{@output}' containing #{output_numbers} characters"
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

  def group_braille_characters ### Better to show/tell or shorten?
    characters = []
    group_by_char = group_braille_lines.map do |group|
      top = group[0].scan(/(..)/).transpose
      middle = group[1].scan(/(..)/).transpose
      bottom = group[2].scan(/(..)/).transpose
      zipper = top.zip(middle)
      zipper.zip(bottom)
    end
    require "pry"; binding.pry
    p "hey"
  end

  def write_text_to_file
    braille_string = group_braille_characters
    output_file_data = @writer.translate_braille(braille_string)
    File.write("./data/#{@output}", output_file_data)
  end

end
