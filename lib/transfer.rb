class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :temp_amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @temp_amount = @amount
      @amount = 0
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if @temp_amount
      receiver.balance -= @temp_amount
      sender.balance += @temp_amount
      @status = "reversed"
    end
  end

end
