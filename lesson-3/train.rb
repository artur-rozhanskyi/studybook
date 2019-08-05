# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'validatable'

class Train
  include Manufacturer
  include Validatable

  NUMBER_FORMAT = /\A([a-z]|\d){3}-*([a-z]|\d){2}\z/i.freeze

  attr_reader :number, :carriages, :speed, :route,
              :current_station_number

  @instances = []

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, NUMBER_FORMAT

  class << self
    attr_reader :instances

    def find(number)
      Train.instances.find { |train| train.number == number }
    end
  end

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    Train.instances << self
  end

  def accelerating_by(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def hook_carriage(carriage)
    carriages << carriage if carriage.is_a?(self.class::CARRIAGE_TYPE)
  end

  def unhook_carriage
    raise "Speed is'n zero" if speed.positive?
    raise 'No carriages' if carriages.empty?

    carriages.pop
  end

  def receive_route(route)
    self.route = route
    self.current_station_number = 0
  end

  def print_prev_current_next_station
    puts "Prev station #{previous_station.name}" unless first_station?

    puts "Current station #{current_station.name}"
    puts "Next station #{next_station.name}" unless last_station?
  end

  def each_carriage
    return carriages.to_enum(:each) unless block_given?

    carriages.each { |carriage| yield(carriage) }
  end

  def type_info
    raise NotImplementedError
  end

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
