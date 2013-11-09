#!/usr/bin/env ruby

# This tool is Apache licensed.
# Run license_gen_apache YelloSoft 2009
# See apache.txt for details.

# == Synopsis
#
# license_gen_apache: Generates Apache notices based on the Apache License:
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Include a copy of the actual Apache license with your software.
#
# == Usage
#
# license_gen_apache owners year [margin]
#
# Owners:
#    The copyright owners.
# Year:
#    The copyright year.
# Margin:
#    The width of the copyright message.

require 'time'

# From ttscoff's wrap_text()
# http://snipplr.com/view/1081/wrap-text/
class String
  def wrap(margin = 80)
    gsub(/(.{1,#{margin}})( +|$\n?)|(.{1,#{margin}})/, '\\1\\3\n')
  end
end

def self.gen(owners = 'The Apache Software Foundation', year = Time.now.year, margin = 80)
  "Copyright #{year} #{owners}

Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.".wrap margin
end

def main
  argc = ARGV.length

  owners = 'The Apache Software Foundation'
  year = '2004'
  margin = 80

  owners = ARGV[0] unless argc < 1
  year = ARGV[1] unless argc < 2
  margin = ARGV[2] unless argc < 3

  puts gen(owners, year, margin)
end

main if $PROGRAM_NAME == __FILE__
