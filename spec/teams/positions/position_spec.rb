require 'spec_helper'


describe Soccer::Teams::Positions::Position do

  describe ".get_defender_positions" do 
    
    it "should return :foward with 40% and center_foward: 60% chance if the position is :goalkeepr" do 
      other     = double(name: :goalkeeper)
      position  = Soccer::Teams::Positions::Position.new
      positions = position.get_defender_positions(other)
      expect(positions).to include(foward: 40, center_foward: 60)
    end


    it "should return more than one possibilities and his probabilities" do 
      other     = double(name: :defender)
      position  = Soccer::Teams::Positions::Position.new
      positions = position.get_defender_positions(other)
      expect(positions).to include(center_foward: 40, foward: 40, midfielder: 20 )
    end
  end

end