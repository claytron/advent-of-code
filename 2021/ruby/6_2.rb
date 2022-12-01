# frozen_string_literal: true

inputs = File.read('6.input').strip.split(',').map(&:to_i)

days = 256

items = days.times.reduce(inputs.tally) do |i|
  new = Hash.new(0)
  i.each do |k, v|
    case k
      when 1..8 then new[k - 1] += v
      when 0
        new[6] += v
        new[8] += v
    end
  end
  new
end

puts items.values.sum
