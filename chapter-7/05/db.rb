RSpec.configure do |c|
  # ...

  c.around(:example, :db) do |example|
    DB.transaction(rollback: :always) { example.run }
  end
end

