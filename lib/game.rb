require './lib/formatting'
class Game

  def start
    puts "Welcome to the ship of battles. Enter P to play or Q to quit"
    directions
    create_game
  end

  private

  def directions
   i = gets.chomp.downcase
   if i == ("p")
     show_prompt
   else
     puts "Goodbye!"
     exit
   end
  end

  def show_prompt
    Formatting.show_game_intro
  end

  def create_game
    Simulator.new
  end
end
