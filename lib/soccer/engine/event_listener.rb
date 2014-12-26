module Soccer
  module Engine
    class EventListener
      attr_reader :subscribers

      def initialize
        @subscribers = {}
      end

      def subscribe(event, subscriber)
        if @subscribers.has_key?(event)
          @subscribers[event] << subscriber
        else
         @subscribers[event] = [subscriber]
        end
      end
    end
  end
end
