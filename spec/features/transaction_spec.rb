require 'transaction'

describe Transaction do
  let(:today) { Time.now }
  subject(:transaction) { described_class.new(today, 500, nil, 1000) }
  let(:debit_transaction) { described_class.new(today, nil, 500, 500) }

  it 'records and reveals the date' do
    expect(transaction.date).to eq(today)
  end

  it 'records and reveals the credit' do
    expect(transaction.credit).to eq(500)
  end

  it 'records and reveals the debit amount' do
    expect(debit_transaction.debit).to eq(500)
  end

  it 'records and reveals the balance' do
    expect(transaction.balance).to eq(1000)
  end
end
