# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input")

results = inputs.scan(/mul\(\d{1,3},\d{1,3}\)/).collect do |match|
  match.scan(/\d{1,3}/).map(&:to_i).reduce(:*)
end

puts results.sum
