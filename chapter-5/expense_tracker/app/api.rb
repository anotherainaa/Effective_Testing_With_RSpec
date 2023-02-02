require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
      super()
    end

    post '/expenses' do
      # parse an expense from the request body
      expense = JSON.parse(request.body.read)

      # Use it's ledger to record the expense
      result = @ledger.record(expense)

      # return a JSON document containing the resulting expense ID
      JSON.generate('expense_id' => result.expense_id)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end