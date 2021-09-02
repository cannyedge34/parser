module Parser
  module Cli
    module Validator
      module Condition
        class ArgumentsCount
          def initialize(argv)
            @argv = argv
          end

          def valid?
            argv.size == 1
          end

          def error_klass
            'Parser::Exceptions::CliArgumentsCountError'
          end

          attr_reader :argv
        end
      end
    end
  end
end
