class Reunion

  attr_reader :location, :activities, :activity

  def initialize(location = "home", activity, participants)
    @location = location
    @activity = activity
    @participants = participants
    @activities =[]
  end

  def add_activity
    @activities << Activity.new(@activity, @participants)
  end

end
