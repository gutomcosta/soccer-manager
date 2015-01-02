require "soccer/engine/version"
require "soccer/engine/game"
require "soccer/engine/randomizer"
require "soccer/engine/dice"
require "soccer/engine/event_listener"
require "soccer/subscribers/game_started_subscriber"
require "soccer/teams/team"
require "soccer/teams/player"
require "soccer/teams/actions/short_pass"
require "soccer/teams/positions/position"
require "soccer/teams/positions/goal_keeper"
require "soccer/teams/positions/center_foward"
require "soccer/teams/positions/foward"
require "soccer/teams/positions/midfielder"

module Soccer
  module Engine

    def self.start_game(team1, team2, listener)
      game     = Game.new(team1, team2, listener )
      game.start
    end
  end
end
