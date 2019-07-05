# frozen_string_literal: true

require_relative 'station'

class Route
  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_mediate_station(index_after_station, mediate_station)
    raise if index_after_station.negative? || less_then_last?(index_after_station)

    stations.insert(index_after_station + 1, mediate_station)
  end

  def delete_mediate_station(mediate_station_name)
    raise if [stations.first.name, stations.last.name]
             .include?(mediate_station_name)

    stations.delete_if { |s| s.name == mediate_station_name }
  end

  private

  def less_then_last?(index)
    index > stations.length - 2
  end
end
