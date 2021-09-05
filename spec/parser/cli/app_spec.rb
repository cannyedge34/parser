require 'parser/cli/app'
require 'parser/validator/app'

describe Parser::Cli::App do
  subject(:cli) do
    described_class.new(validator: Parser::Validator::App.new)
  end

  let(:argv) { ['test'] }

  describe '#call' do
    it 'returns the argument content' do
      expect(cli.call(argv)).to eq('test')
    end

    context 'when validation failed' do
      shared_examples 'no arguments error' do
        it 'raises CliNoArgumentsError' do
          expect { cli.call(argv) }
            .to raise_exception(Parser::Exceptions::CliNoArgumentsError,
                                'Can not proceed without argument.')
        end
      end

      context 'when argument does not exist' do
        let(:argv) do
          []
        end

        it_behaves_like 'no arguments error'
      end

      context 'with empty string' do
        let(:argv) do
          ['']
        end

        it_behaves_like 'no arguments error'
      end

      context 'with two arguments' do
        let(:argv) { %w[test second-argument] }

        it 'raises CliArgumentsCountError' do
          expect { cli.call(argv) }
            .to raise_exception(Parser::Exceptions::CliArgumentsCountError,
                                'Cannot proceed with more than one argument.')
        end
      end
    end
  end
end
