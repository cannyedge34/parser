require 'parser/app'

describe Parser::App do
  subject(:app) do
    described_class.new(
      cli: cli,
      resolver: resolver,
      presenter: presenter
    )
  end

  let(:cli) { instance_double(Parser::Cli::App) }
  let(:resolver) { instance_double(Parser::Resolver::App) }
  let(:presenter) { instance_double(Parser::Presenter::App) }

  before { Parser.load }

  describe '#call' do
    it 'returns the output by calls chain of nested objects' do
      allow(cli).to receive(:call).with('test-argv').and_return('test-resolver')
      allow(resolver).to receive(:call).with('test-resolver').and_return('test-output')
      allow(presenter).to receive(:call).with('test-output').and_return('test-data')
      expect(app.call('test-argv')).to eq('test-data')
    end

    context 'when exception is raised' do
      it 'rescues the exception with message output' do
        allow(cli).to receive(:call).with('test-argv').and_raise(StandardError.new('test message'))
        expect(Parser::Exceptions).to receive(:print).with('test message')
        app.call('test-argv')
      end
    end
  end
end
