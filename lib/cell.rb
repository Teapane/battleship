class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship.nil?
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit unless empty?
  end

  def render(reveal = false)
    if @ship.sunk
      "X"
    elsif @fired_upon
      "H"
    elsif reveal
      "S"
    else
      "."
    end
  end
end

