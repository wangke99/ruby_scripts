require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

#<1> location of the rss feed
source='http://online.wsj.com/xml/rss/3_8068.xml'
content=''

#<2> read in all information from source
open(source) do |info|
  content=info.read
end

#<3>
rss=RSS::Parser.parse(content, false)

print "Do you want to see feed description (y/n)?"
input=gets.chomp

desc=input=='y'||input=='Y'

puts "\n\nTITLE: #{rss.channel.title}"
puts "DESCRIPTION: #{rss.channel.description}"
puts "LINK: #{rss.channel.link}"
puts "PUBLICATION DATE: #{rss.channel.date} \n\n"

#<4>
rss.items.size.times do |i|
  puts "#{rss.items[i].date}...#{rss.items[i].title}"
  if desc
    print "#{rss.items[i].description}\n\n\n"
  end
end

