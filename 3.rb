# frozen_string_literal: true

# get an array of each column
inputs = File.read('3.input').split("\n").map(&:chars).transpose

raw_gamma = inputs.reduce('') do |obj, i|
  counts = i.tally
  obj + counts.key(counts.values.max)
end

gamma = raw_gamma.to_i(2)
epsilon = raw_gamma.tr('0', '2').tr('1', '0').tr('2', '1').to_i(2)

puts gamma * epsilon
