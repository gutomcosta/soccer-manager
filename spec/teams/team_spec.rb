require 'spec_helper'


describe Soccer::Teams::Team do
  let(:players) { (0..10).map {|i| double }} 
  let(:dice) { double }


  describe ".initialize" do 

    it "should receive 11 players" do 
      team = Soccer::Teams::Team.new(players, dice)
      expect(team.players.size).to eql(11)
    end

    it "should raise an errors if the number of players is incorrect" do 
      expect { Soccer::Teams::Team.new([double, double,double], dice)}.to raise_error("[ Team.new ] - A team have to be a 11 players.")
    end

    it "should receive a dice" do 
      team = Soccer::Teams::Team.new(players, dice)
      expect(team.dice).not_to be_nil      
    end
  end

  describe ".start" do 
    let(:team) { Soccer::Teams::Team.new(players, dice)}
    let(:a_player) { double }

    before(:each) do 
      allow(a_player).to receive(:execute_an_action)
      expect(dice).to receive(:roll).with(players).and_return(a_player)
    end

    it "selects a player" do 
      team.start
    end
    
    it "calls to a player execute an action" do 
      expect(a_player).to receive(:execute_an_action)
      team.start
    end
  end

end

