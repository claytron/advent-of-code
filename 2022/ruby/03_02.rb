# frozen_string_literal: true

require 'set'

inputs = File.read('../03.input').split("\n").each_slice(3)

alpha = ('a'..'z').to_a

value = inputs.each.sum do |sacks|
  s1 = Set.new(sacks[0].chars)
  s2 = Set.new(sacks[1].chars)
  s3 = Set.new(sacks[2].chars)

  (s1 & s2 & s3).each.sum do |char|
    base_value = alpha.index(char.downcase) + 1

    if /[[:upper:]]/.match(char)
      base_value + 26
    else
      base_value
    end
  end
end

puts value
