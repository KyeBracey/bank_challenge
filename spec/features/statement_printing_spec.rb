require 'account'
require 'statement_printer'

describe 'Statement Printing' do
  let(:account) { Account.new }

  it 'Statement can be printed by calling the method on Account' do
    expect(STDOUT).to receive(:puts)
      .with('date || credit || debit || balance')
    expect(STDOUT).to receive(:puts)
      .with('No transaction history')
    account.print_statement
  end
end
