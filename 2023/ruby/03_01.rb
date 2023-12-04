# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input").split("\n")

def valid?(pos, len, specs)
  !(Range.new(pos - 1, pos + len).to_a & specs).empty?
end

special_re = Regexp.new(/[^\w\d.]|_/)
num_re = Regexp.new(/\d+/)
specials_coords = []
potential_coords = []

inputs.each do |line|
  specials_coords << line.enum_for(:scan, special_re).map { Regexp.last_match.begin(0) }
  potential_coords << line.enum_for(:scan, num_re).map do
    m = Regexp.last_match
    "#{m.begin(0)}.#{m.to_s.length}.#{m}"
  end
end

valid = []
invalid = []
potential_coords.each_with_index do |potentials, idx|
  next if potentials.empty?

  prev = idx - 1
  nxt = idx + 1
  specials = []
  prev_specials = specials_coords[prev]
  nxt_specials = specials_coords[nxt]

  specials.concat(prev_specials) unless prev.negative?
  specials.concat(specials_coords[idx])
  specials.concat(nxt_specials) if nxt_specials

  potentials.each do |potential|
    pos, len, num = potential.split('.').map(&:to_i)
    if valid?(pos, len, specials)
    valid << num
    else
      invalid << num
    end
  end
end

puts valid.sum
