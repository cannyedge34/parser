describe Parser do
  describe '.load' do
    it 'requires app files' do
      expect { described_class.load }.to avoid_exception
    end

    context 'when loaded' do
      before do
        described_class.load
      end

      it { expect(Parser::Cli::App).to be_kind_of(Class) }
    end
  end
end
