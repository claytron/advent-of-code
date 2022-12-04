# frozen_string_literal: true

require 'set'

inputs = File.read('../04.input').split.map { |i| i.split(',') }

matches = inputs.each.sum do |coord|
  e1 = Set.new(Range.new(*coord[0].split('-').map(&:to_i)))
  e2 = Set.new(Range.new(*coord[1].split('-').map(&:to_i)))

  e1.subset?(e2) || e2.subset?(e1) ? 1 : 0
end

puts matches
