# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input").split("\n")

def valid?(pos, len, specs)
  !(Range.new(pos - 1, pos + len).to_a & specs).empty?
end

def specials_pos(line)
  special_re = Regexp.new(/[^\w\d.]|_/)
  line.enum_for(:scan, special_re).map { Regexp.last_match.begin(0) }
end

num_re = Regexp.new(/\d+/)
valid = []

inputs.each_with_index do |line, idx|
  specials = []
  specials.concat(specials_pos(inputs[idx - 1])) if idx.positive?
  specials.concat(specials_pos(line))
  specials.concat(specials_pos(inputs[idx + 1])) if inputs[idx + 1]

  line.enum_for(:scan, num_re).map do
    m = Regexp.last_match
    value = m.to_s
    valid << value.to_i if valid?(m.begin(0), value.length, specials)
  end
end

puts valid.sum
