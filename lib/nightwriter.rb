input = ARGV[0].chomp
output = ARGV[1].chomp

file_in = File.read("./lib/#{input}")

output_count = output.size

# file_out = File.write()

p "Created #{output} containing #{file_in.size} characters"
