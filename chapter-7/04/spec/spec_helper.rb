require 'fileutils'

RSpec.configure do |config|
  config.around(:example) do |ex|
    original_env = ENV.to_hash
    ex.run
    ENV.replace(original_env)
  end

  config.before(:suite) do 
    # Remove leftover temporary files
    FileUtils.rm_rf('tmp')
  end
end