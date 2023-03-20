
=begin
- We've inherited specs for two different URI parsers 
- similar but not identical behaviour
- figure out the common functionality
- extract it to shared specs using the techniques shared
=end

require 'uri'

RSpec.describe URI do
  it 'parses the host' do
    expect(URI.parse('http://foo.com/').host).to eq 'foo.com'
  end

  it 'parses the port' do
    expect(URI.parse('http://example.com:9876').port).to eq 9876
  end

  it 'defaults the port for an http URI to 80' do 
    expect(URI.parse('http://example.com/').port).to eq 80
  end

  it 'defaults the port for an https URI to 443' do
    expect(URI.parse('https://example.com').port).to eq 443
  end
end

