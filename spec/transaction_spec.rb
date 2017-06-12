require 'transaction'

describe Transaction do
  let(:deposit) { described_class.new(:deposit, 10, 20) }
  let(:withdrawal) { described_class.new(:withdrawal, 10, 20) }
  time = Time.now
  Timecop.freeze(time)
  describe '#initialise' do
    it 'shows what type of transaction took place' do
      expect(deposit.type).to eq(:deposit)
    end
    it 'shows the amount that was processed' do
      expect(deposit.amount).to eq(10)
    end
    it 'can process a deposit' do
      expect(deposit).to have_attributes(type: :deposit)
    end
    it 'can process a withdrawal' do
      expect(withdrawal).to have_attributes(type: :withdrawal)
    end
    it 'shows the date it took place' do
      expect(deposit.date).to eq(time)
    end
  end

  describe '#balance' do
    it 'shows the new balance for a deposit' do
      expect(deposit.balance).to eq(30)
    end
    it 'shows the new balance for a withdrawal' do
      expect(withdrawal.balance).to eq(10)
    end
  end
end
