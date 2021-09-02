module Parser
  module Cli
    module Validator
      module Condition
        class NoArguments
          def initialize(argv)
            @argv = argv
          end

          def valid?
            argv.any?
          end

          def error_klass
            'Parser::Exceptions::CliNoArgumentsError'
          end

          attr_reader :argv
        end
      end
    end
  end
end
