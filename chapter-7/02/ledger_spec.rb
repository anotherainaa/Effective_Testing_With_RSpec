# Example that could be done using the expense tracker

pit 'successfully saves the expense in the DB' do
  result = ledger.record(expense)

  expect(result).to be_success
  expect(DB[:expenses].all)to match [a_hash_including(
    id: result.expense_id,
    payee: 'Starbucks',
    amount: 5.75,
    date: Date.iso8601('2017-06-10')
  )]
end