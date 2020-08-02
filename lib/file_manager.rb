class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./textfiles/#{input}").downcase
    @output = output
  end

  def output_message
    output_characers = @file_in.gsub(/\s+/, '').length
    "Created '#{@output}' containing #{output_characers} characters"
  end

### Change to output in braile
  def output_file
    File.write("./textfiles/#{@output}", @file_in.upcase)
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


end
