RSpec.describe MyApp::Conifguration do
  around(:example) do |ex|
    original_env = ENV.to_hash
    ex.run
    ENV.replace(original_env)
  end
end