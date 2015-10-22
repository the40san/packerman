$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'packerman'


class String
  def undent
    min_space_num = self.split("\n").delete_if{|s| s=~ /^\s*$/ }.map{|s| s[/^\s+/].length }.min
    gsub(/^[ \t]{,#{min_space_num}}/, '').chomp
  end
end
