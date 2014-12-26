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

      def publish(event_name, data)
        handlers = @subscribers[event_name]
        return if handlers.nil?
        handlers.each do |handle|
          handle.execute(data)
        end
      end

    end
  end
end
