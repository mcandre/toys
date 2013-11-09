require 'contracts'
include Contracts

# From ttscoff's wrap_text()
# http://snipplr.com/view/1081/wrap-text/
class String
  Contract Num => String
  def wrap(margin = 80)
    gsub(/(.{1,#{margin}})( +|$\n?)|(.{1,#{margin}})/, "\\1\\3\n")
  end
end
