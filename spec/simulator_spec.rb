require './lib/simulator.rb'

describe Simulator do
  let(:simulator) { described_class.new }

  it 'exists' do
    expect(simulator).to be_an_instance_of(Simulator)
  end
end
