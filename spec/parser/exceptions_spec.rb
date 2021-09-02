require 'parser/exceptions'

describe Parser::Exceptions do
  describe '.print' do
    it 'returns the output by calls chain of nested objects' do
      expect(PP).to receive(:pp).with('message')
      described_class.print('message')
    end
  end
end
