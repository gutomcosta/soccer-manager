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

  describe ".roll_to_choose" do 
    
    it "returns :foward when choices are {forward: 100}" do 
      choice = dice.roll_to_choose({foward: 100})
      expect(choice).to eql(:foward)
    end

    it "returns :midfielder when choices are {defender: 30, midfielder: 70} and guess between 1 and 70" do 
      allow(dice).to receive(:roll).and_return(55, 1, 10, 20, 70)
      expect(dice.roll_to_choose({defender: 30, midfielder: 70})).to eql(:midfielder)
      expect(dice.roll_to_choose({defender: 30, midfielder: 70})).to eql(:midfielder)
      expect(dice.roll_to_choose({defender: 30, midfielder: 70})).to eql(:midfielder)
      expect(dice.roll_to_choose({defender: 30, midfielder: 70})).to eql(:midfielder)
      expect(dice.roll_to_choose({defender: 30, midfielder: 70})).to eql(:midfielder)
    end

  end



end
