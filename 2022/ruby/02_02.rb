# frozen_string_literal: true

inputs = File.read('../02.input').split("\n").map(&:split)

PLAYS = {
  'A' => :rock, 'B' => :paper, 'C' => :scissors,
  'X' => :lose, 'Y' => :draw, 'Z' => :win
}.freeze

WINS = {
  rock: :scissors,
  paper: :rock,
  scissors: :paper,
}.freeze

TYPE = {
  rock: 1,
  paper: 2,
  scissors: 3,
}.freeze

def calculate_score(player1, player2)
  case player2
    when :draw
      3 + TYPE[player1]
    when :lose
      0 + TYPE[WINS[player1]]
    when :win
      6 + TYPE[WINS.invert[player1]]
  end
end

score = inputs.sum do |game|
  calculate_score(PLAYS[game[0]], PLAYS[game[1]])
end

puts score
