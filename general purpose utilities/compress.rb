require 'zip/zip'

if ARGV.size!=2
  puts "Usage: ruby compress.rb <filename.ext> <zipfilename>"
  puts "Example: ruby compress.rb myfile.exe myfile"
  exit
end

file=ARGV[0].chomp

if File.exists?(file)
  zip="#{ARGV[1].chomp}.zip"
  Zip::ZipFile.open(zip, true) do |zipfile|
    begin
      puts "#{file} is being added to the archive."
      zipfile.add(file, file)
    rescue Exception => e
      puts "Error adding to zipfile: \n #{e}"
    end
  end
else
  puts "\nFile could not be found."
end
