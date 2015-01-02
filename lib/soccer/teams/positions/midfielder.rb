module Soccer
  module Teams
    module Positions
      class Midfielder
        attr_reader :name

        def initializer
          @name = :midfielder
        end

        def possible_actions
          markov_chain = {:shor_pass => 0.3, :long_pass => 0.4}


          
        end
      end
    end
  end
end

