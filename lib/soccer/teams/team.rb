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

    end
  end
end
