# frozen_string_literal: true

inputs = File.read('../02.input').split("\n").map(&:split)

PLAYS = {
  'A' => :rock, 'B' => :paper, 'C' => :scissors,
  'X' => :rock, 'Y' => :paper, 'Z' => :scissors
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
  score = if player1 == player2
    3
  elsif WINS[player2] == player1
    6
  else
    0
  end

  score + TYPE[player2]
end

score = inputs.sum do |game|
  calculate_score(PLAYS[game[0]], PLAYS[game[1]])
end

puts score
