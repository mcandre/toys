"""CGI form"""

import KenanKelQuote

KenanKelQuote.load_quotes()

import cgi

FORM = cgi.FieldStorage()

QUOTE = KenanKelQuote.get_quote()

print "Content-type: text/html\n\n"

print "<html>"
print "\t<head><title>KenanKelQuote></title</head>\n"
print "\t<body>\n\t\t<p>%s\n\t\t</p>\n" % QUOTE
print "\t\t<form action=\"QuoteCGI.py\" method=\"get\">"
print "\t\t\t<input type=submit value=\"Generate\">"
print "\t\t</form>"
print "\t</body>"
print "</html>"
