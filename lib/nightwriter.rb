require './lib/reader'

input = ARGV[0].chomp
output = ARGV[1].chomp
message = FileManager.new(input, output)
p message.output_message
