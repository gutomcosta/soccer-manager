module Soccer
  module Teams
    module Actions
      class ShortPass

        def initialize(event_listener, game)
          
        end


        def execute(action_data)
          player   = action_data[:player]
          team     = action_data[:team]
          opponent = game.opponent_from(team)
          defender = opponent.get_defender_for(player.position)

          
        end
      end
    end
  end
end

      
