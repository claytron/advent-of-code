# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input").split("\n")
rows = inputs.map(&:chars).map { |i| i.map(&:to_i) }

joltages = []
rows.each do |row|
  # Max leaving off the last digit since that can't be used to make a two digit number
  max = row[..-2].max
  idx = row.index(max)
  max2 = row[(idx + 1)..].max
  joltages << "#{max}#{max2}".to_i
end

puts joltages
puts joltages.sum
