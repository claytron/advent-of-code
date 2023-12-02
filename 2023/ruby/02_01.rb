# frozen_string_literal: true

inputs = File.read("../input/02#{ARGV[0]}.input").split("\n")

cube_max = {
  'red' => 12,
  'green' => 13,
  'blue' => 14,
}

valid_games = inputs.map do |game|
  game_info, res = game.split(':')
  game_num = game_info.split(' ')[1].to_i

  valid = true
  draws = res.split(';').map(&->(i) { i.gsub(',', '') }).map(&:split)
  draws.each do |draw_info|
    draw = draw_info.each_slice(2).map(&:reverse).to_h
    valid = draw.map do |k, v|
      v.to_i <= cube_max[k]
    end.all?
    break unless valid
  end

  game_num if valid
end.compact

puts valid_games.sum
