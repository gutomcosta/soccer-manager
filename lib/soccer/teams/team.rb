module Soccer
  module Teams
    class Team
      attr_reader :players, :dice
      def initialize(players, dice)
        raise "[ Team.new ] - A team have to be a 11 players." if players.nil? or ( players.size != 11)
        @players = players
        @dice    = dice
      end

      def start
        player = dice.roll(players)
        player.execute_an_action
      end

      def get_defender_for(position)
        defender_positions = position.get_defender_positions
        position_name      = @dice.roll_to_choose(defender_positions)
        selected_positions = @players.select {|p| p.position_name == position_name}
        dice.roll(selected_positions)
      end

    end
  end
end
