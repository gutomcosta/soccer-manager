require 'spec_helper'


describe Soccer::Engine::Dice do 
  let(:random) { double }
  let(:dice) { Soccer::Engine::Dice.new(random)}

  before(:each) do 
    allow(random).to receive(:randomize).and_return(0)
  end

  describe ".roll" do
    it "should receive an array of argurments" do 
      dice.roll([1,2,3])
    end

    it "raise an error if the array is empty" do 
      expect{ dice.roll([]) }.to raise_error("[ Dice.roll ] - Empty Array")
    end

    it "should use the start and end index of the array to generate a range to randomize" do 
      expect(random).to receive(:randomize).with(0..2)
      dice.roll(["a", "b", "c"])
    end

    it "gets a random index to use in the array of arguments and get the array element" do 
      allow(random).to receive(:randomize).and_return(2)
      element = dice.roll(["a", "b", "c"])
      expect(element).to eq("c")
    end

  end



end
