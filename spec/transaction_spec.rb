require 'transaction'

describe Transaction do
  describe '#initilisation' do
    it 'initialises with a type' do
      type = :deposit
      amount = 10
      transaction = described_class.new(type, amount)
      expect(transaction.type).to eq(:deposit)
    end
    it 'initialises with an amount' do
      type = :deposit
      amount = 10
      transaction = described_class.new(type, amount)
      expect(transaction.amount).to eq(amount)
    end
  end
end
