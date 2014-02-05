module PerformLater
  module Workers
    class Base

      protected
      def self.perform_job(object, method, arguments)
        unless arguments_empty?(arguments)
          if arguments.size == 1
            object.send(method, arguments.first)
          else
            object.send(method, *arguments)
          end
        else
          object.send(method)
        end
      end

      def self.arguments_empty?(arguments)
        arguments.empty? || (arguments.size == 1 && arguments.first.is_a?(Array) && arguments.first.empty?)
      end
    end
  end
end
