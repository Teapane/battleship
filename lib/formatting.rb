require './lib/board.rb'

class Formatting

  def self.show_game_intro
    p <<~HEREDOC
        I have laid out my ships on the grid.
        You now need to lay out your two ships.
        The Cruiser is three units long and the Submarine is two units long.
        Below is the board, "#{Board.new.cells}"
    HEREDOC
  end
end
