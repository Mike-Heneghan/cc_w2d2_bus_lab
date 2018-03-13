class Bus

attr_reader :route_number, :destination

  def initialize(input_route_number, input_destination)

    @route_number = input_route_number
    @destination = input_destination
    @passengers = []
  end

  def drive_sound
    return "Brum brum"
  end

  def count_passengers
    return @passengers.count
  end

  def add_passenger(passenger)
    @passengers.push(passenger)
  end

  def drop_off_passenger(passenger)
    @passengers.delete(passenger)
  end

end
