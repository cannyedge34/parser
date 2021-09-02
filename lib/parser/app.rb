require_relative './exceptions'

module Parser
  class App
    def initialize(
      cli:
    )
      @cli = cli
    end

    def call(argv)
      inner_call(argv)
    rescue StandardError => e
      Parser::Exceptions.print(e.message)
    end

    private

    def inner_call(argv)
      cli.call(argv).then do |input|
        input
      end
    end

    attr_reader :cli
  end
end
