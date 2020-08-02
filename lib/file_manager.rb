require './lib/writer'

class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./data/#{input}").downcase
    @output = output
    @writer = Writer.new
  end

  def output_message
    output_characers = @file_in.gsub(/\s+/, '').length
    "Created '#{@output}' containing #{output_characers} characters"
  end

  def create_lines
    text = @file_in
    lines = []
    while text.chars.length >= 40
      new_line = text.split("",41)
      text = new_line.pop
      lines << new_line
    end
    lines
  end

  def write_braille_to_file
    output_file_data = ""
    create_lines.each do |line|
      output_file_data << @writer.write_braille_line(line)
    end
    File.write("./data/#{@output}", output_file_data)
  end






end
