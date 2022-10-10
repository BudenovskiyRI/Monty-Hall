require "./game.rb"

tries = 1000
results = {
  changed_and_won: 0,
  changed_and_lost: 0,
  keep_and_won: 0,
  keep_and_lost: 0
};

for i in (1..tries)
  prize_door          = Random.new.rand(3)
  player_door         = Random.new.rand(3)
  player_change_chose = Random.new.rand(2) == 1
  
  game = Game.new(prize_door, player_door, player_change_chose)

  if game.play == :win
    if player_change_chose
      results[:changed_and_won] += 1
    else
      results[:keep_and_won] += 1
    end
  else
    if player_change_chose
      results[:changed_and_lost] += 1
    else
      results[:keep_and_lost] += 1
    end
  end
end

puts "Tries: #{tries}"
puts "Win rate on keep door:   ~#{(results[:keep_and_won] * 100.0 / (results[:keep_and_won] + results[:keep_and_lost])).round(2)}%"
puts "Win rate on change door: ~#{(results[:changed_and_won] *100.0 / (results[:changed_and_won] + results[:changed_and_lost])).round(2)}%"