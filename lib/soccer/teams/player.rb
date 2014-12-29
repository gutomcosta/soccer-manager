module Soccer
  module Teams
    class Player
      attr_reader :dice, :position, :team

      def initialize(dice, position, team)
        @dice = dice
        check_position(position)
        @position = position
        @team     = team
      end

      # maybe is better move this to position
      def check_position(position)
        valid_positions = [ :goalkeeper, :defender, :midfielder, :forward ]
        raise "[ Player.new ] - Invalid position. The valid positions are: [ goalkeeper, defender, midfielder, forward ]" unless valid_positions.include?(position.name)
      end

      def execute_an_action
        actions = position.possible_actions
        action  = dice.roll(actions)
        action.execute(player: self, team: @team)
      end

    end
  end
end