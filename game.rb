class Game
  def initialize(prize_door, player_door, player_change_chose = false)
    @doors = Array.new(3).map.with_index { |v, idx| Door.new(idx == prize_door ? "Prize" : nil)}
    @player_door = @doors[player_door]
    @player_change_chose = player_change_chose
  end

  def play
    opened_door = nil
    closed_door = nil

    for door in @doors
      if !opened_door && door != @player_door && !door.prize?
        # host open door without prize
        opened_door = door
      elsif door != @player_door
        closed_door = door
      end
    end

    selected_door = @player_change_chose ? closed_door : @player_door
    
    if selected_door.prize?
      :win
    else
      :lose
    end
  end
end

class Door
  def initialize(prize = nil)
    @prize = prize
  end

  def prize?
    @prize
  end
end