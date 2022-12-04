# frozen_string_literal: true

require 'set'

inputs = File.read('../04.input').split.map { |i| i.split(',') }

matches = inputs.each.sum do |coord|
  e1 = Set.new(Range.new(*coord[0].split('-').map(&:to_i)))
  e2 = Set.new(Range.new(*coord[1].split('-').map(&:to_i)))

  (e1 & e2).empty? ? 0 : 1
end

puts matches
