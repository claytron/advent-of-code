# frozen_string_literal: true

inputs = File.read('6.input').strip.split(',').map(&:to_i)

days = 80

items = days.times.reduce(inputs) do |school|
  next_day = []
  new_items = []
  school.each do |i|
    if i.zero?
      next_day.push(6)
      new_items.push(8)
    else
      next_day.push(i - 1)
    end
  end

  next_day + new_items
end

puts items.count
