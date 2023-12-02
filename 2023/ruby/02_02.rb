# frozen_string_literal: true

inputs = File.read("../input/02#{ARGV[0]}.input").split("\n")

powers = inputs.map do |game|
  _, res = game.split(':')

  power = Hash.new { [] }
  draws = res.split(';').map(&->(i) { i.gsub(',', '') }).map(&:split)
  draws.each do |draw_info|
    draw = draw_info.each_slice(2).map(&:reverse).to_h
    draw.each do |k, v|
      power[k] = power[k] << v.to_i
    end
  end

  power.values.map(&:max).reduce(&:*)
end

puts powers.sum
