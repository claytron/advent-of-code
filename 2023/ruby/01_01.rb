# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

result = inputs.each.map do |input|
  input.scan(/\d/).values_at(0, -1).join.to_i
end

puts result.sum
