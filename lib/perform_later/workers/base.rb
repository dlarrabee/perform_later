module PerformLater
  module Workers
    class Base

      protected
      def self.perform_job(object, method, arguments)
        if arguments.empty?
          object.send(method)
        else
          object.send(method, *arguments)
        end
      end
    end
  end
end
