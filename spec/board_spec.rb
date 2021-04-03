require 'rspec'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/board.rb'

describe Board do
  let(:board) { described_class.new }
  let(:cruiser) { Ship.new("Submarine", 3) }
  it 'exists' do
    expect(board).to be_an_instance_of(Board)
  end

  it 'generates cells' do
    expect(board.cells).to be_a(Hash)
    expect(board.cells.length).to eq(16)
    expect(board.cells.first).to include("A1")
    expect(board.cells.first[1]).to be_an_instance_of(Cell)
  end

  it 'determines if a cell is on the board' do
    expect(board.valid_coordinate?("A1")).to be(true)
  end

  it 'returns false if a coordinate is not on the board' do
    expect(board.valid_coordinate?("Z9")).to be(false)
  end

  it 'can validate a ships placement' do
    place = board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    expect(place).to be(true)
  end

  it 'is not valid if not consecutive' do
    place = board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    expect(place).to be(false)
  end

  it 'is not valid if not consecutive columns' do
    place = board.valid_placement?(cruiser, ["C1", "A2", "A1"])
    expect(place).to be(false)
  end
end
