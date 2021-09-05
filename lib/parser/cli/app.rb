module Parser
  module Cli
    class App
      Conditions = Struct.new(:cli_no_arguments_error, :cli_arguments_count_error)

      def initialize(validator:)
        @validator = validator
      end

      def call(argv)
        validator.validate(Conditions.new(cli_no_arguments_error(argv), cli_arguments_count_error(argv)))
        argv[0]
      end

      private

      attr_reader :validator

      def cli_no_arguments_error(argv)
        argv.any? && !argv.first&.empty?
      end

      def cli_arguments_count_error(argv)
        argv.size == 1
      end
    end
  end
end
