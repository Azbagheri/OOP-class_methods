class BankAccount
@@interest_rate
@@accounts = []

attr_accessor  :balance

def Initialize
  @balance = 0
end

def deposit(amount)
  @balance = @balance + amount
end

def withdraw(amount)
  @balance = @balance - amount
end
