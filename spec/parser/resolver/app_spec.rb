require 'parser/resolver/app'

describe Parser::Resolver::App do
  subject(:resolver) do
    described_class.new
  end

  it 'returns the sequence of a specific character that appears the most in sequence' do
    expect(resolver.call('Pressuuuuuure')).to eq('uuuuuu')
    expect(resolver.call('Boat')).to eq('B')
    expect(resolver.call('aBBBcc')).to eq('BBB')
    expect(resolver.call('aCCCBBB')).to eq('CCC')
    expect(resolver.call('A hot  dog')).to eq('  ')
  end
end
