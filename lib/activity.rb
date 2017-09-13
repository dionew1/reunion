class Activity

  attr_reader :name

  def initialize(name, participants)
    @name = name
    @participants = participants
  end

  def participant_names
    names = @participants.map do |participant|
      participant[:name]
    end
    names
  end

  def participant_paid
    paid = @participants.map do |participant|
      participant[:paid].to_f
    end
    paid
  end

  def cost
    participant_paid.sum
  end

  def cost_split
    cost/@participants.count
  end

  def participant_debt
    debts = []
    @participants.each do |participant|
      debt = []
      debt << participant[:name]
      debt << (cost_split - participant[:paid].to_i).to_s
      debts << Hash[*debt]
    end
    debts
  end


end
