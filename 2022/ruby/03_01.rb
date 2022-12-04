# frozen_string_literal: true

require 'set'

inputs = File.read('../03.input').split("\n")

alpha = ('a'..'z').to_a

value = inputs.each.sum do |sack|
  size = sack.length
  s1 = Set.new(sack.chars.slice(0, size / 2))
  s2 = Set.new(sack.chars.slice(size / 2, size))

  (s1 & s2).each.sum do |char|
    base_value = alpha.index(char.downcase) + 1

    if /[[:upper:]]/.match(char)
      base_value + 26
    else
      base_value
    end
  end
end

puts value
