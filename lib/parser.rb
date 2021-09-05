module Parser
  class << self
    def load
      %w[
        lib/parser/app
        lib/parser/cli/app
        lib/parser/resolver/app
        lib/parser/presenter/app
        lib/parser/validator/app
      ].each do |path|
        require File.expand_path(path)
      end
    end

    def run(args)
      Parser::App.new(
        cli: Parser::Cli::App.new(validator: Parser::Validator::App.new),
        resolver: Parser::Resolver::App.new,
        presenter: Parser::Presenter::App.new
      ).call(args)
    end
  end
end
