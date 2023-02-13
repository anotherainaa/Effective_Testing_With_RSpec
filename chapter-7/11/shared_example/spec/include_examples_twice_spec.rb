RSpec.describe 'Key-value stores' do
  include_examples 'KV store', HashKVStore
  include_examples 'KV store', FileKVStore
end