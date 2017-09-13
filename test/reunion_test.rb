require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_reunion_exists
    reunion = Reunion.new("beach", "bowling", {:name => "Kelly", :paid => 4.00})

    assert_instance_of Reunion, reunion
  end

  def test_reunion_has_activites
    reunion = Reunion.new("beach", "bowling", {:name => "Kelly", :paid => 4.00})

    assert_equal 1, reunion.activities.count
  end

  def test_reunion_has_location
    reunion = Reunion.new("beach", "bowling", {:name => "Kelly", :paid => 4.00})

    assert_equal "beach", reunion.location
  end


end
