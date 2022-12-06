# frozen_string_literal: true

require 'set'

input = File.read('../06.input').chomp.chars

count = 0
input.each_cons(14) do |byte|
  count += 1
  break if Set.new(byte).count == 14
end

puts count + 13
