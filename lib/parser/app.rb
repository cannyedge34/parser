require_relative './exceptions'

module Parser
  class App
    def initialize(
      cli:,
      resolver:
    )
      @cli = cli
      @resolver = resolver
    end

    def call(argv)
      inner_call(argv)
    rescue StandardError => e
      Parser::Exceptions.print(e.message)
    end

    private

    def inner_call(argv)
      cli.call(argv).then do |input|
        resolver.call(input).then do |output|
          output
        end
      end
    end

    attr_reader :cli, :resolver
  end
end
