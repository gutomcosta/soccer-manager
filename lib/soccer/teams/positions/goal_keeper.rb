module Soccer
  module Teams
    module Positions
      class GoalKeeper
        attr_reader :name

        def initializer
          @name = :goalkeeper
        end

        def possible_actions
          markov_chain = {:shor_pass => 0.3, :long_pass => 0.4}


          
        end
      end
    end
  end
end

