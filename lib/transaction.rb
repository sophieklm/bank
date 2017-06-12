class Transaction
  attr_reader :type, :amount, :date, :balance

  def initialize(type, amount, balance)
    @type = type
    @amount = amount
    @date = Time.now
    @balance = process_balance(type, amount, balance)
  end

  private

  def process_balance(type, amount, balance)
    if type == :deposit
      return balance + amount
    elsif type == :withdrawal
      return balance - amount
    end
  end

end
