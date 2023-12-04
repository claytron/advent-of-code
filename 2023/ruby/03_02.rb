# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input").split("\n")

def valid?(pos, len, specs)
  !(Range.new(pos - 1, pos + len).to_a & specs).empty?
end

def num_pos(line, spec_pos)
  num_re = Regexp.new(/\d+/)
  line.enum_for(:scan, num_re).map do
    m = Regexp.last_match
    value = m.to_s
    value.to_i if valid?(m.begin(0), value.length, [spec_pos])
  end.compact
end

special_re = Regexp.new(/\*/)
ratios = []

inputs.each_with_index do |line, idx|
  stars = line.enum_for(:scan, special_re).map { Regexp.last_match.begin(0) }

  stars.each do |star|
    num_prev = num_pos(inputs[idx - 1], star) if idx.positive?
    num_next = num_pos(inputs[idx + 1], star) if inputs[idx + 1]

    # handles match above and below or two above or two below
    if num_prev.length == 2
      ratios << num_prev[0] * num_prev[1]
    elsif num_next.length == 2
      ratios << num_next[0] * num_next[1]
    elsif !num_prev.empty? && !num_next.empty?
      ratios << num_prev[0] * num_next[0]
    end

    num_cur = num_pos(line, star)
    cur_matches = num_cur.length
    num_first = num_cur[0]
    # Handles two on one line or current line and above or below
    case cur_matches
      when 2 then ratios << num_first * num_cur[1]
      when 1
        if num_prev[0]
          ratios << num_prev[0] * num_first
        elsif num_next[0]
          ratios << num_next[0] * num_first
        end
    end
  end
end

puts ratios.sum
