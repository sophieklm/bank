require 'account'

describe Account do

  subject(:account) { described_class.new()}

  describe '#balance' do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq(0)
    end
  end

end
