require 'zip/zip'
require 'fileutils'

if ARGV.size!=2
  puts "Usage: ruby decompress.rb <zipfilename.zip> <directory>"
  puts "Example: ruby decompress.rb myfile.zip ."
  exit
end

archive=ARGV[0].chomp

if File.exists?(archive)
  extract_dir=ARGV[1].chomp
  begin
    Zip::ZipFile::open(archive) do |zipfile|
      zipfile.each do |f|
        path=File.join(extract_dir, f.name)
        FileUtils.mkdir_p(File.dirname(path))
        zipfile.extract(f, path)
        puts 'SUCCESS!'
      end
    end
  rescue Exception => e
    puts e
  end
else
  puts "An error occurred during decompression"    
end
