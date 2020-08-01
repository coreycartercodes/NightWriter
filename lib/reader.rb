class Reader
  attr_reader :file_in

  def initialize (input, output)
    @file_in = File.read("./lib/#{input}")
  end

  def output_message
    output_characers = readfile.gsub(/\s+/, '',).length
    p "Created #{output} containing #{read_file.size} characters"
  end

end
