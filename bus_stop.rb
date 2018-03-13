class BusStop

  attr_reader :name

  def initialize(input_name, input_queue)
    @name = input_name
    @queue = input_queue
  end

  def count_queue
    return @queue.count
  end

  def return_the_queue
    return @queue
  end

  def add_person_to_queue(person)
    return @queue.push(person)
  end

  def bus_stop_emptied
    return @queue.clear()
  end
end
