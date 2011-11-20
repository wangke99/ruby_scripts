require 'cgi'

#<1>Specify that the HTML4.0 version be used for generating code
cgi=CGI.new('html4Tr')

#<2>request information from users
print "Enter Form Page Title: "
title=gets.chomp
print "Enter Head Title: "
input_title=gets.chomp
print "Enter value for button: " 
value=gets.chomp
print "Enter group: "
group=gets.chomp

#<3>Redirection of standard output; redirect to a new file

$stdout=File.new('form.html', 'w')
cgi.out{
  CGI.pretty(
    cgi.html{
#<4>      
        cgi.head{"\n" + cgi.title{title}} +
        cgi.body{"\n" +
          cgi.form{"\n" +
            cgi.hr +
            cgi.h1 {"#{input_title}: "} + "\n" +
            cgi.br +
            cgi.checkbox(group, value) + value + cgi.br + cgi.br +
            cgi.textarea("input", 80,5) + "\n" +
            cgi.br +
            cgi.submit("Send")
            }
          }
    }
  )
}

$stdout.close