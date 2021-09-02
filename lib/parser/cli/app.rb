require_relative './validator'

module Parser
  module Cli
    class App
      include Validator

      def call(argv)
        validate(argv)
        argv[0]
      end
    end
  end
end
