RSpec.shared_examples 'URI Parser' do |uri_parser_class|
  it 'parses the host' do
    expect(uri_parser_class.parse('http://foo.com/').host).to eq 'foo.com'
  end
end

