require("minitest/autorun")
require_relative("../bus_stop.rb")
require_relative("../person.rb")

class TestBusStop < Minitest::Test

  def setup

    person1  = Person.new("Joseph", 42)
    person2  = Person.new("Mike", 26)
    person3  = Person.new("Mariana", 28)
    person4  = Person.new("Andrew", 25)
    person5  = Person.new("Claudia", 25)
    @queue = [person1, person2, person3, person4 ,person5]

    @person6 = Person.new("Pawel", 29)

    @bus_stop1 = BusStop.new("Leith", @queue)

  end

  def test_bus_stop_name
    name_of_stop = @bus_stop1.name()
    assert_equal("Leith", name_of_stop)
  end

  def test_bus_stop_queue
    queue_on_bus = @bus_stop1.return_the_queue
    assert_equal(@queue, queue_on_bus)
  end

  def test_add_person_to_queue
    @bus_stop1.add_person_to_queue(@person6)
    assert_equal(6, @bus_stop1.count_queue)
  end

  def test_bus_stop_emptied
    @bus_stop1.bus_stop_emptied()
    assert_equal(0, @bus_stop1.count_queue )
  end
  
end
