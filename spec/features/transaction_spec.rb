require 'transaction'

describe Transaction do
  let(:today) { Time.now }
  subject(:transaction) { described_class.new(today, 500, nil, 1000) }
  let(:debit_transaction) { described_class.new(today, nil, 500, 500) }

  it 'Returns all four pieces of information as a hash' do
    expect(transaction.information).to eq(date: today,
                                          credit: 500,
                                          debit: nil,
                                          balance: 1000)
  end
end
