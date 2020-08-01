require './lib/reader'

input = ARGV[0].chomp
output = ARGV[1].chomp
read_file = Reader.new(input, output)
p read_file.output_message
