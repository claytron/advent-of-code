# frozen_string_literal: true

inputs = File.read("../input/03_02#{ARGV[0]}.input")

parsed = inputs.split("don't()")
valid = [parsed.delete_at(0)]

parsed.each do |line|
  dos = line.split('do()')
  if dos.count > 1
    dos.delete_at(0)
    valid += dos
  end
end

results = valid.join.scan(/mul\(\d{1,3},\d{1,3}\)/).collect do |match|
  match.scan(/\d{1,3}/).map(&:to_i).reduce(:*)
end

puts results.sum
