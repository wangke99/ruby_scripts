require 'open-uri'
#<1>
require 'csv'

#<2>
def get_info(stock_symbol)
  puts "#{stock_symbol} Current Ticker Information"
  #<3>
  url="http://ichart.finance.yahoo.com/table.csv?s=#{stock_symbol}&d=10&e=20&f=2011&g=d&a=3&b=12&c=1996&ignore=.csv"
  puts "Connecting to #{url}\n\n\n"
    #<4>
    csv=CSV.parse(open(url).read)
    csv.each do |row|
      puts "--------------------------------------------------"
      puts "Information current as of #{row[3]} on #{row[2]}\n\n"
      puts "#{row[0]}'s last trade was -$#{row[1]} (increase of #{row[4]})\n\n"
      puts "\tOpened at $#{row[5]}"
      puts "\tRange for the day $#{row[7]}-$#{row[6]}"
    end
    puts "--------------------------------------------------"
end

print "Enter stock symbol (separate by space if >1): "
stock_symbols=gets.upcase

#<5>
stock_symbols.split.each do |symbol|
  get_info(symbol)
end


