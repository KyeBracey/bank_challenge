require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'Starts with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  it 'Handles float deposits/withdrawals' do
    account.deposit(90.93)
    account.withdraw(67)
    expect(account.balance).to eq(23.93)
  end

  describe '#deposit' do
    it 'Adds the amount to the balance' do
      expect { account.deposit(500) }.to change { account.balance }.by(500)
    end
  end

  describe '#withdraw' do
    it 'Deducts the amount from the balance' do
      account.deposit(500)
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end

    it 'Raises error when trying to withdraw from an empty account' do
      expect { account.withdraw(1) }.to raise_error('Cannot withdraw - account is empty')
    end

    it 'Raises error when trying to withdraw more than the current balance' do
      account.deposit(200)
      expect { account.withdraw(500) }.to raise_error('Cannot withdraw that much. Balance: 200.00')
    end
  end
end
