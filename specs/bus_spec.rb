require("minitest/autorun")
require_relative("../bus.rb")
require_relative("../person.rb")

class TestBus < MiniTest::Test

  def setup

    # route_number = 22
    # destination = 'Ocean Terminal'

    @my_bus22 = Bus.new(22, "Ocean Terminal")
    @my_bus35 = Bus.new(35, "Leith")

    @person1 = Person.new("Joseph", 42)

    @person2 = Person.new("Mike", 26)

  end

  def test_route_number
    route = @my_bus22.route_number()
    assert_equal(22, route)
  end

  def test_destination
    final_stop = @my_bus22.destination()
    assert_equal("Ocean Terminal",final_stop)
  end

  def test_drive_sound
    driving_sound = @my_bus22.drive_sound()
    assert_equal("Brum brum",driving_sound)
  end

  def test_count_passengers
    number_of_passengers = @my_bus22.count_passengers()
    assert_equal(0,number_of_passengers)
  end

  def test_add_passenger
    @my_bus22.add_passenger(@person1)
    assert_equal(1,@my_bus22.count_passengers)
  end

  def test_drop_off_passenger
    @my_bus35.add_passenger(@person1)
    @my_bus35.add_passenger(@person2)

    @my_bus35.drop_off_passenger(@person1)

    assert_equal(1, @my_bus35.count_passengers)
  end

  def test_empty_bus
    @my_bus35.add_passenger(@person1)
    @my_bus35.add_passenger(@person2)

    @my_bus35.empty_bus()

    assert_equal(0, @my_bus35.count_passengers)
  end

end
