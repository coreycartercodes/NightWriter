require './lib/data_manager'

input = ARGV[0].chomp
output = ARGV[1].chomp
message = DataManager.new(input, output)
p message.output_message_writer
message.write_braille_to_file
