RSpec.configure do |config|
  config.filter_run_excluding :jruby_only unless RUBY_PLATFORM == 'java'
end
