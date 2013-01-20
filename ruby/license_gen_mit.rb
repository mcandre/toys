#!/usr/bin/env ruby

# This tool is MIT licensed.
# Run license_gen_mit YelloSoft 2009

# == Synopsis
#
# license_gen_mit: Generates MIT licenses based on The MIT License:
#
# http://www.opensource.org/licenses/mit-license.php
#
# == Usage
#
# license_gen_mit owners year [margin]
#
# Owners:
#    The copyright owners.
# Year:
#    The copyright year.
# Margin:
#    The width of the copyright message.

require "time"

# From ttscoff's wrap_text()
# http://snipplr.com/view/1081/wrap-text/
class String
	def wrap(margin=80)
		gsub(/(.{1,#{margin}})( +|$\n?)|(.{1,#{margin}})/, "\\1\\3\n")
	end
end

def gen(owners="MIT", year=Time.now.year, margin=80)
	return "The MIT License

Copyright (c) #{year} #{owners}

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.".wrap(margin)
end

def main
	owners="MIT"
	year="1988"
	margin=80

	owners=ARGV[0] unless ARGV.length<1
	year=ARGV[1] unless ARGV.length<2
	margin=ARGV[2] unless ARGV.length<3

	puts gen(owners, year, margin)
end

main if __FILE__ == $0