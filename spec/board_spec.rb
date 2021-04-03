require 'rspec'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/board.rb'

describe Board do
  let(:board) { described_class.new }
  it 'exists'  do
    expect(board).to be_an_instance_of(Board)
  end

  it 'generates cells' do
    expect(board.cells).to be_a(Hash)
    expect(board.cells.length).to eq(16)
    expect(board.cells.first).to include("A1")
    expect(board.cells.first[1]).to be_an_instance_of(Cell)
  end
end

