require 'spec_helper'


describe Soccer::Teams::Player do
  let(:dice) { double }
  let(:position) { double(name: :goalkeeper)}
  let(:team) { double }

  describe ".initialize" do 

    it "should receive a dice" do 
      player = Soccer::Teams::Player.new(dice, position, team)
      expect(player.dice).not_to be_nil
    end

    it "should receive a position" do 
      player = Soccer::Teams::Player.new(dice, position, team)
      expect(player.position).not_to be_nil
    end

    it "should belongs to a team" do 
      player = Soccer::Teams::Player.new(dice, position, team)
      expect(player.team).not_to be_nil
    end

    it "raises an error if the position is invalid" do
      expect{ Soccer::Teams::Player.new(dice, double(name: :atacante), team) }.to raise_error("[ Player.new ] - Invalid position. The valid positions are: [ goalkeeper, defender, midfielder, forward, center_foward ]")
    end
  end

  describe ".execute_an_action" do 
    let(:player) { Soccer::Teams::Player.new(dice, position, team)} 
    let(:action) { double }

    before(:each) do 
      allow(action).to receive(:execute)
    end

    it "chooses the action should be executed, based on the position" do 
      expect(position).to receive(:possible_actions).and_return([double, double, action])
      expect(dice).to receive(:roll).and_return(action)
      player.execute_an_action
    end
    
    it "delegates the execution to selected action" do 
      allow(position).to receive(:possible_actions).and_return([double, double, action])
      allow(dice).to receive(:roll).and_return(action)

      expect(action).to receive(:execute).with(player: player, team: player.team)

      player.execute_an_action

    end
  end



end