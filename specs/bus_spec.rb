require("minitest/autorun")
require_relative("../bus.rb")
require_relative("../person.rb")
require_relative("../bus_stop.rb")

class TestBus < MiniTest::Test

  def setup

    # route_number = 22
    # destination = 'Ocean Terminal'

    @my_bus22 = Bus.new(22, "Ocean Terminal")
    @my_bus35 = Bus.new(35, "Leith")

    @person1 = Person.new("Joseph", 42)

    @person2 = Person.new("Mike", 26)

    @person3  = Person.new("Henry", 68)
    @person4  = Person.new("Dafty", 122)
    @person5  = Person.new("Mariana", 28)
    @person6  = Person.new("Andrew", 25)
    @person7  = Person.new("Claudia", 25)
    @queue = [@person3, @person4, @person5, @person6 , @person7]

    @person8 = Person.new("Pawel", 29)

    @bus_stop1 = BusStop.new("Leith", @queue)

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

  def test_pick_up_from_bus_stop__queue_to_bus
    @my_bus35.add_passenger(@person1)
    @my_bus35.add_passenger(@person2)

    @my_bus35.pick_up_from_bus_stop(@bus_stop1)

    assert_equal(7, @my_bus35.count_passengers)
  end

  def test_pick_up_from_bus_stop__queue_delted
    @my_bus35.add_passenger(@person1)
    @my_bus35.add_passenger(@person2)

    @my_bus35.pick_up_from_bus_stop(@bus_stop1)

    assert_equal(0, @bus_stop1.count_queue)
  end



end
