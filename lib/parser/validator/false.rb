module Parser
  module Validator
    class False
      def call(error)
        raise error
      end
    end
  end
end
