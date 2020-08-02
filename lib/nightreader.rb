require './lib/file_manager'

input = ARGV[0].chomp
output = ARGV[1].chomp
message = FileManager.new(input, output)
p message.output_message_braille_in
message.write_text_to_file
