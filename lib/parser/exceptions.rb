require 'pp'

module Parser
  module Exceptions
    class CliArgumentsCountError < StandardError
      def message
        'Cannot proceed with more than one argument.'
      end
    end

    class CliNoArgumentsError < StandardError
      def message
        'Can not proceed without argument.'
      end
    end

    def self.print(error)
      PP.pp error
    end
  end
end
