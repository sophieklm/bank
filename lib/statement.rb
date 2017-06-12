class Statement
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end
end
