context 'when the expense fails validation' do
  # ...

  before do 
    allow(ledger).to receive(:record)
      .with(expense)
      .and_return(RecordResult.new(false, 417, 'Expense incomplete'))
  end

  # ...
end
