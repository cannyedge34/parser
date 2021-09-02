require 'parser/presenter/app'

describe Parser::Presenter::App do
  subject(:presenter) do
    described_class.new
  end

  it 'returns the passed string' do
    expect(presenter.call('uuuuuu')).to eq('uuuuuu')
  end
end
