# Description of the example group
RSpec.describe 'My awesome gradening API' do
end

# Or, it could be a Ruby class, module or object
RSpec.describe Perennials::Rhubard do
end

RSpec.describe Perennials do
end

RSpec.describe my_favourite_broccoli do
end

# We can also combine two appraoches

RSpec.describe Garden, 'in winter' do
end

# Using metadata with describe

RSpec.describe WeatherStation, 'radar updates', uses_netword: true do
end

# Using metadata with it

RSpec.describe Sprinkler do
  it 'waters te garden', uses_serial_bus: true
end

# grouping examples together using context instead of describe where appropriate

# An awkward example of describe
RSpec.describe 'A kettle of water' do
  describe 'when boiling' do
    it 'can make tea'
    it 'can make coffee'
  end
end

# An appropriate example of using context
RSpec.describe 'A kettle of water' do
  context 'when boiling' do
    it 'can make tea'
    it 'can make coffee'
  end
end

# Using example instead of it

# Akward example of it
RSpec.describe PhoneNumberParser, 'parses phone numbers' do
  it 'in xxx-xxx-xxxx form'
  it 'in (xxx) xxx-xxxx form'
end

# A better example using the keyword example that fits the context
RSpec.describe PhoneNumberParser, 'parses phon numbers' do
  example 'in xxx-xxx-xxxx form'
  example 'in (xxx) xxx-xxxx form'
end

# specify instead of it

# A good example is when we have cross-cutting concern such as library deprecations
RSpec.describe 'Deprecations' do
  specify 'MyGem.config is deprecated in favor of MyGem.configure'
  specify 'MyGem.run is deprecared in favor of MyGem.start'
end
