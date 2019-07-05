# frozen_string_literal: true

require './train'

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def recieve_train(train)
    trains << train
  end

  def send_train(train_number)
    trains.delete_if { |t| t.number == train_number }
  end

  def trains_count_by_type(type)
    trains.count { |t| t.type == type }
  end
end
