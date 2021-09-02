require 'parser/cli/app'

describe Parser::Cli::App do
  subject(:cli) do
    described_class.new
  end

  let(:argv) { ['test'] }

  describe '#call' do
    it 'returns the argument content' do
      expect(cli.call(argv)).to eq('test')
    end

    context 'when validation failed' do
      context 'when argument does not exist' do
        let(:argv) do
          []
        end

        it 'raises CliNoArgumentsError' do
          expect { cli.call(argv) }
            .to raise_exception(Parser::Exceptions::CliNoArgumentsError,
                                'Can not proceed without argument.')
        end
      end
    end

    context 'with 2 arguments' do
      let(:argv) { %w[test second-argument] }

      it 'raises CliArgumentsCountError' do
        expect { cli.call(argv) }
          .to raise_exception(Parser::Exceptions::CliArgumentsCountError,
                              'Cannot proceed with more than one argument.')
      end
    end
  end
end
