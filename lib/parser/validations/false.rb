module Parser
  module Validations
    class False
      def validate!(error)
        raise error
      end
    end
  end
end
