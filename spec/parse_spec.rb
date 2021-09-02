describe 'parse' do # rubocop:disable RSpec/DescribeClass
  let(:command) { system './parse.rb "Pressuuuuuure"' }
  let(:info) do
    'uuuuuu'
  end

  specify 'prints correct info to stdout' do
    expect { command }.to output(a_string_including(info)).to_stdout_from_any_process
  end
end
