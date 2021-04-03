require_relative './cell'

class Board
  attr_reader :cells

  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @cells = create_board_with_cells
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coords)
    false if invalid_length?(ship, coords)
    consecutive_coordinates?(coords)
  end

  private

  def create_board_with_cells
    letters.each_with_object({}) do |letter, hash|
      numbers.each do |num|
        hash[letter + num] = Cell.new(letter + num)
      end
      hash
    end
  end

  def letters
    "A".upto("D").to_a
  end

  def numbers
    1.upto(4).to_a.map(&:to_s)
  end

  def invalid_length?(ship, coords)
    coords.length != ship.length
  end

  def consecutive_coordinates?(coords)
    if on_same_row?(coords)
      range(coords) == coords
    else
      false
    end
  end

  def on_same_row?(coordinates)
    coordinates.all? do |x|
      x.chars.first == coordinates.first.chars.first
    end
  end

  def range(coords)
    (coords.first..coords.last).to_a
  end
end
