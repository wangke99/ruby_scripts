if ARGV.size !=2
  puts 'Usage: ruby fileSplit.rb <filename.ext> <size_of_pieces_in_bytes>'
  puts 'Example: ruby fileSplit.rb myfile.txt 10'
  exit
end

filename=ARGV[0]
size_of_split=ARGV[1]

if File.exists?(filename)
  file=File.open(filename,'r')
  size=size_of_split.to_i
  
  puts "The file is #{File.size(filename)} bytes"
  
  temp=File.size(filename).divmod(size)
  pieces=temp[0]
  extra=temp[1]
  
  puts "\nSplitting the file into #{pieces} (#{size} byte) pieces and 1 (#{extra} byte) piece"
  
  pieces.times do |n|
    f=File.open("#{filename}.rsplit#{n}", 'w')
    f.puts file.read(size)
  end
  
  e=File.open("#{filename}.rsplit#{pieces}", 'w')
  e.puts file.read(extra)
else
  puts "\n\nFile does NOT exist, please check filename."
  
end
