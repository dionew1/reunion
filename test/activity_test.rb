require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_exists
    activity = Activity.new("bowling", {:name => "Kelly", :paid => 4.00})

    assert_instance_of Activity, activity
  end

  def test_activity_has_name
    activity = Activity.new("bowling", {:name => "Kelly", :paid => 4.00})

    actual = activity.name

    assert_equal "bowling", actual
  end

  def test_activity_has_participant_name
    activity = Activity.new("bowling", [{:name => "Kim", :paid => "4.00"},{:name => "Kelly", :paid => "4.00"}])

    actual = activity.participant_names

    assert_equal ["Kim" ,"Kelly"], actual
  end

  def test_activity_has_participant_paid
    activity = Activity.new("Bowling", [{:name => "Kim", :paid => "4.00"},{:name => "Kelly", :paid => "4.00"}])

    actual = activity.participant_paid

    assert_equal [4.00, 4.00], actual
  end

  def test_activity_cost
    activity = Activity.new("Bowling",[{:name => "Kim", :paid => "4.00"},{:name => "Kelly", :paid => "4.00"}])

    actual = activity.cost

    assert_equal 8.00, actual
  end

  def test_activity_cost
    activity = Activity.new("Bowling",[{:name => "Kim", :paid => "4.00"},{:name => "Kelly", :paid => "4.00"}])

    actual = activity.cost_split

    assert_equal 4.00, actual
  end

  def test_participants_debt
    activity = Activity.new("Bowling",[{:name => "Kim", :paid => "3.00"},{:name => "Kelly", :paid => "5.00"}])
    actual = activity.participant_debt

    assert_equal [{"Kim" => "1.0"},{"Kelly" => "-1.0"}], actual
  end



end
