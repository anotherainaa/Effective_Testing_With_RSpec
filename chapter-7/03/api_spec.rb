RSpec.describe 'POST a successful expense' do
  # let definitions
  let(:ledger) { instance_double('ExpenseTracker::Ledger') }
  let(:expense) { { 'some' => 'data' } }

  # hook
  before do
    allow(ledger).to receive(:record)
      .with(expense)
      .and_return(RecordResult.new(true, 417, nil))
  end

  # helper method
  def parsed_last_response
    JSON.parse(last_response.body)
  end
end

