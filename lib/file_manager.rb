require './lib/writer'

class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./data/#{input}").downcase
    @output = output
    @writer = Writer.new
  end

  def output_message_text_in
    output_characters = @file_in.gsub(/\s+/, '').length
    "Created '#{@output}' containing #{output_characters} characters"
  end

  def output_message_braille_in
    output_characters = ((@file_in.chars.length)/6)
    "Created '#{@output}' containing #{output_characters} characters"
  end

  def create_lines_of_text ###does this forget the end of the message?
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

  def create_lines_of_braille
    text = @file_in
    lines = []
    while text.chars.length >= 80
      new_line = text.split("\n", 2)
      text = new_line.pop
      lines << new_line
    end
    lines << text
    lines
  end

  def write_text_to_file
    output_file_data = ""
    create_lines_of_braille.each do |line|
      output_file_data << @writer.write_text_line(line)
    end
    File.write("./data/#{@output}", output_file_data)
  end





end
