module Soccer
  module Teams
    module Positions
      class CenterFoward
        attr_reader :name

        def initializer
          @name = :center_foward
        end

        def possible_actions
          markov_chain = {:shor_pass => 0.3, :long_pass => 0.4}


          
        end
      end
    end
  end
end

