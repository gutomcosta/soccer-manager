module Soccer
  module Teams
    module Actions
      class ShortPass

        def initialize(event_listener, game, dice)
          @event_listener = event_listener
          @game           = game
          @dice           = dice
          @possible_events= [:wrong_pass, :fault, :cross_touch_line, :cross_corner_line, :goal, :right_pass] 
        end


        def execute(action_data)
          player   = action_data[:player]
          team     = action_data[:team]
          opponent = @game.opponent_from(team)
          defender = opponent.get_defender_for(player.position)
          score    = player.final_score_against(defender)
          if score <= 0 
            @event_listener.publish(:ball_intercepted, player:player, defender: defender, game: @game)
            return
          elsif (1..5).include?(score)
            @event_listener.publish(:cross_touch_line, player: player, defender: defender, game: @game)
            return
          elsif (6..8).include?(score)
            @event_listener.publish(:cross_corner_line, player: player, defender: defender, game: @game)
            return
          elsif (9..30).include?(score)
            @event_listener.publish(:wrong_pass, player: player, defender: defender, game: @game)
            return
          elsif (31..100).include?(score)
            @event_listener.publish(:right_pass, player: player, defender: defender, game: @game)
            return
          end
        end
      end
    end
  end
end

      
