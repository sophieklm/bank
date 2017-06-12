class Account

attr_reader :balance, :transactions

def initialize
  @balance = 0
  @transactions = []
end

def deposit(amount)
  catch_error(amount)
  @balance += amount
end

def withdraw(amount)
  catch_error(amount)
  fail "Withdrawal exceeds account balance" if (@balance - amount) < 0
  @balance -= amount
end

private

def catch_error(amount)
  fail "Cannot process a negative amount" if amount < 0
end

end
