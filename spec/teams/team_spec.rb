require 'spec_helper'


describe Soccer::Teams::Team do
  let(:players) { (0..10).map {|i| double }} 
  let(:dice) { double }
  let(:a_player) { double }


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

  describe ".get_defender_for" do 

    let(:players) do 
      [ double(position_name: :goalkeeper), 
        double(position_name: :defender), double(position_name: :defender), double(position_name: :defender),
        double(position_name: :midfielder), double(position_name: :midfielder), double(position_name: :midfielder),
        double(position_name: :foward),double(position_name: :foward),double(position_name: :foward),
        double(position_name: :center_foward)
      ]

    end
    let(:team) do 
      Soccer::Teams::Team.new(players, dice)
    end
    let(:position) { double }

    before(:each) do 
      allow(dice).to receive(:roll_to_choose)
      allow(dice).to receive(:roll)
    end

    it  "asks the position to possible defender positions and his probabilities" do 
      position = double
      expect(position).to receive(:get_defender_positions)
      team.get_defender_for(position)
    end

    it "uses the dice to get a guess about what defender possibility to use" do 
      positions = double
      allow(position).to receive(:get_defender_positions).and_return(positions)
      expect(dice).to receive(:roll_to_choose).with(positions)
      team.get_defender_for(position)
    end

    it "selects the players with selected position using the dice" do 
      positions = double
      allow(position).to receive(:get_defender_positions).and_return(positions)
      allow(dice).to receive(:roll_to_choose).with(positions).and_return(foward: 100)
      expect(dice).to receive(:roll)
      team.get_defender_for(position)
    end
  end

end

