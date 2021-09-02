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

  describe '.run' do
    before do
      described_class.load
    end

    let(:app_klass) { Parser::App }
    let(:app) { instance_double(app_klass) }

    it 'calls Parser::App with passed argument' do
      expect(app_klass).to receive(:new).with(
        cli: be_instance_of(Parser::Cli::App),
        resolver: be_instance_of(Parser::Resolver::App)
      ).once.and_return(app)
      expect(app).to receive(:call).once.with('test-source-path')
      described_class.run('test-source-path')
    end
  end
end
