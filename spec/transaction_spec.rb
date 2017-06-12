require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(:deposit, 20) }
  time = Time.now
  Timecop.freeze(time)
  describe '#initilise' do
    it 'shows what type of transaction took place' do
      expect(subject.type).to eq(:deposit)
    end
    it 'shows the amount that was processed' do
      expect(subject.amount).to eq(20)
    end
    it 'can process a deposit' do
      deposit = described_class.new(:deposit, 20)
      expect(deposit).to have_attributes(type: :deposit)
    end
    it 'can process a withdrawal' do
      withdrawal = described_class.new(:withdrawal, 20)
      expect(withdrawal).to have_attributes(type: :withdrawal)
    end
    it 'shows the date it took place' do
      transaction = described_class.new(:deposit, 20)
      expect(transaction.date).to eq(time)
    end
  end
end
