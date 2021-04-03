require 'rspec'
require './lib/ship.rb'

describe Ship do
  let(:ship) { described_class.new("Ultimate Cruiser", 5) }

  it 'has a name and length attr' do
    expect(ship).to be_an_instance_of(Ship)
  end

  it 'has a health method' do
    expect(ship.health).to eq(5)
  end

  it 'can be hit' do
    ship.hit
    expect(ship.health).to eq(4)
  end

  it 'can sink' do
    6.times do
      ship.hit
    end

    expect(ship.sunk).to be(true)
  end
end
