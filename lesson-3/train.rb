# frozen_string_literal: true

class Train
  attr_reader :number, :carriages, :speed, :route,
              :current_station_number

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
  end

  def accelerating_by(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def hook_carriage(carriage)
    carriages << carriage if type == carriage.type
  end

  def unhook_carriage
    raise if speed.positive? || carriages.empty?

    carriages.pop
  end

  def receive_route(route)
    self.route = route
    self.current_station_number = 0
  end

  def print_prev_current_next_station
    puts "Prev station #{previous_station.name}" unless first_station?

    puts "Currurent station #{current_station.name}"
    puts "Next station #{next_station.name}" unless last_station?
  end

  def type
    self.class::TYPE
  end

  private

  attr_writer :speed, :route, :current_station_number

  def first_station?
    current_station_number.zero?
  end

  def last_station?
    current_station_number == route.stations.length - 1
  end

  def previous_station
    route.stations[current_station_number - 1]
  end

  def current_station
    route.stations[current_station_number]
  end

  def next_station
    route.stations[current_station_number + 1]
  end
end
