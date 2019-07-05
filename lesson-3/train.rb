# frozen_string_literal: true

require_relative 'route'
require_relative 'station'

class Train
  attr_accessor :number, :type, :number_carriages, :speed, :route,
                :current_station_number

  def initialize(number, type, number_carriages)
    @number = number
    @type = type
    @number_carriages = number_carriages
    @speed = 0
  end

  def accelerating_by(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def hook_carriages
    self.number_carriages += 1
  end

  def unhook_carriages
    raise if speed.positive? || number_carriages.zero?

    self.number_carriages -= 1
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

  private

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
