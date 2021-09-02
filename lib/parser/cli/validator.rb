require_relative '../exceptions'
require_relative '../validations/validate'
require_relative './validator/condition/no_arguments'
require_relative './validator/condition/arguments_count'

module Parser
  module Cli
    module Validator
      include Validations::Validate

      CONDITIONS = %w[
        NoArguments
        ArgumentsCount
      ].freeze
    end
  end
end
