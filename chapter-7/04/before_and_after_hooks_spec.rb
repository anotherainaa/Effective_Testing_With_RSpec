RSpec.describe MyApp::Configuration do
  before(:example) do
    @original_env = ENV.to_hash
  end

  after(:example) do
    ENV.replace(@original_env)
  end
end

# Scope examples

RSpec.describe 'Web interface to my thermostat' do 
  before(:context) do
    WebBroswer.launch
  end

  after(:context) do
    WebBroswer.shutdown
  end
end