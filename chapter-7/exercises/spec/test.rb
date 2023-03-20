require_relative 'shared_uri_examples'
require 'uri'
require 'addressable'


RSpec.describe 'URI Parser' do
  it_behaves_like 'URI Parser', URI
end

RSpec.describe 'Addressable Parser' do
  it_behaves_like 'URI Parser', Addressable::URI
end