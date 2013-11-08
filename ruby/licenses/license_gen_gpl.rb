#!/usr/bin/env ruby

# This tool is GPLv3 licensed.
# Run license_gen_gpl YelloSoft 2009
# See gpl.txt for details.

# == Synopsis
#
# license_gen_gpl: Generates GPLv3 notices based on The GNU General Public License:
#
# http://www.fsf.org/licensing/licenses/gpl.html
#
# Include a copy of the actual GPL license with your software.
#
# == Usage
#
# license_gen_gpl owners year [margin]
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
    gsub /(.{1,#{margin}})( +|$\n?)|(.{1,#{margin}})/, '\\1\\3\n'
  end
end

def self.gen(owners = 'The Free Software Foundation', year = Time.now.year, margin = 80)
  "Copyright (C) #{year} #{owners}

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.".wrap margin
end

def main
  argc = ARGV.length

  owners = 'The Free Software Foundation'
  year = '2007'
  margin = 80

  owners = ARGV[0] unless argc < 1
  year = ARGV[1] unless argc < 2
  margin = ARGV[2] unless argc < 3

  puts gen(owners, year, margin)
end

main if $PROGRAM_NAME == __FILE__
