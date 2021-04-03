require 'rspec'
require './lib/cell.rb'
require './lib/ship.rb'

describe Cell do
  let(:cell) { described_class.new("B4") }
  let(:ship) { Ship.new("Ultimate Cruiser", 5)}

  it 'exists' do
    expect(cell).to be_an_instance_of(Cell)
  end

  it 'has coordinates' do
    expect(cell.coordinate).to eq("B4")
  end

  it 'can place a ship' do
    expect(cell.place_ship(ship)).to be_an_instance_of(Ship)
  end

  it 'can return the ship' do
    cell.place_ship(ship)
    expect(cell.ship).to eq(ship)
  end

  it 'knows if it is occupied' do
    cell.place_ship(ship)
    expect(cell.empty?).to be(false)
  end

  it 'knows if its been fired_upon' do
    cell.place_ship(ship)
    expect(cell.ship.health).to eq(5)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)
    expect(cell.ship.health).to eq(4)
  end

  it 'renders' do
    cell.place_ship(ship)
    expect(cell.render).to eq(".")
    expect(cell.render(true)).to eq("S")
    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)
    expect(cell.ship.health).to eq(4)
    expect(cell.render).to eq("H")
    10.times do
      cell.fire_upon
    end
    expect(cell.render).to eq("X")
  end
end
