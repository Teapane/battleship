require_relative './cell'

class Board
  attr_reader :cells

  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @cells = generate_cells
  end

  def generate_cells
    letters.each_with_object({}) do |letter, hash|
      numbers.each do |num|
        hash[letter + num] = Cell.new(letter + num)
      end
      hash
    end
  end

  private

  def letters
    "A".upto("D").to_a
  end

  def numbers
    1.upto(4).to_a.map(&:to_s)
  end
end
