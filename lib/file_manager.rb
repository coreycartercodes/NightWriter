class FileManager
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./lib/#{input}")
    @output = output
  end

  def output_message
    output_characers = @file_in.gsub(/\s+/, '').length
    "Created '#{@output}' containing #{output_characers} characters"
  end

  def output_file
    File.write(@output, @file_in.upcase)
  end

end
