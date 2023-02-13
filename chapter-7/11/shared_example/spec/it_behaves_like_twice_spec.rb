RSpec.describe 'Key-value stores' do
  it_behaves_like 'KV store', HashKVStore
  it_behaves_like 'KV store', FileKVStore
end