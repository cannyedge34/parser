require_relative '../../constantize'
require_relative './true'
require_relative './false'

module Parser
  module Validations
    module Validate
      def validate(arg)
        self.class::CONDITIONS.each do |condition|
          "#{self.class}::Condition::#{condition}".constantize.new(arg).then(&method(:validate!))
        end
      end

      private

      def validate!(validator)
        "Parser::Validations::#{validator.valid?.to_s.capitalize}"
          .constantize
          .new
          .then { |verdict| verdict.validate!(validator.error_klass.constantize) }
      end
    end
  end
end
