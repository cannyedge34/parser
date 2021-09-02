require_relative './exceptions'

module Parser
  class App
    def initialize(
      cli:,
      resolver:,
      presenter:
    )
      @cli = cli
      @resolver = resolver
      @presenter = presenter
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
          presenter.call(output)
        end
      end
    end

    attr_reader :cli, :resolver, :presenter
  end
end
