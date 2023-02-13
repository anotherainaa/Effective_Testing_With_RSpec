# Each of these will add the pry: true metadata to its respective example group
# This allows us to toggle :pry metadata using `pit` `pdescribe`

RSpec.configure do |rspec|
  rspec.alias_example_group_to :pdescribe, pry: true
  rspec.alias_example_to :pit. pry: true
  
  rspec.after(:example, pry: true) do |ex|
    require 'pry'
    binding.pry
  end
end