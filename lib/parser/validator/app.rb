require_relative '../exceptions'
require_relative '../../constantize'
require_relative './true'
require_relative './false'

module Parser
  module Validator
    class App
      def validate(conditions)
        conditions.each_pair do |condition, value|
          "::Parser::Validator::#{value.to_s.capitalize}".constantize.new.call(exception_klass(condition))
        end
      end

      private

      def exception_klass(condition)
        "::Parser::Exceptions::#{condition.to_s.split('_').map(&:capitalize).join}".constantize
      end
    end
  end
end
