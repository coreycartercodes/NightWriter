class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./textfiles/#{input}")
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

end
