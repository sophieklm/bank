require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    catch_error(amount)
    process_transaction(:deposit, amount)
  end

  def withdraw(amount)
    catch_error(amount)
    fail 'Withdrawal exceeds account balance' if (@balance - amount) < 0
    process_transaction(:withdrawal, amount)
  end

  private

  def catch_error(amount)
    fail 'Cannot process a negative amount' if amount < 0
  end

  def process_transaction(type, amount)
    transaction = Transaction.new(type, amount)
    self.transactions << transaction
    if type == :deposit
      @balance += amount
    elsif type == :withdrawal
      @balance -= amount
    end
  end
end
