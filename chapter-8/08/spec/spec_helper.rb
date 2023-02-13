RSpec.configure do |config|
  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end
end

# RSpec.describe do
#   it 'matches type: :model', type: :model do |example|
#     expect(example.metadata).to include(matched_by_type_model: true)
#   end
# end
