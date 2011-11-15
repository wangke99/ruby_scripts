print "Enter Loan amount:"
loan =  gets.chomp.to_i
print "Enter length of time in months: "
time = gets.chomp.to_i
print "Enter interest rate: "
rate=gets.chomp.to_f/100

i=(1+rate/12)**(12/12)-1
annuity=(1-(1/(1+i))**time)/i

payment=loan/annuity

puts "\n$%.2f per month" % [payment]

