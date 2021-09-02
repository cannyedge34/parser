require 'parser/app'

describe Parser::App do
  subject(:app) do
    described_class.new(
      cli: cli
    )
  end

  let(:cli) { instance_double(Parser::Cli::App) }

  before { Parser.load }

  describe '#call' do
    it 'returns the output by calls chain of nested objects' do
      allow(cli).to receive(:call).with('test-argv').and_return('test-parser')
      expect(app.call('test-argv')).to eq('test-parser')
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
