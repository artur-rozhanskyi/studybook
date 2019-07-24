# frozen_string_literal: true

class Station
  attr_reader :name, :trains

  @my_instances = []

  def initialize(name)
    @name = name
    @trains = []
    self.class.my_instances << self
  end

  def receive_train(train)
    trains << train
  end

  def send_train(train_number)
    trains.delete_at(trains.index { |t| t.number == train_number })
  end

  def trains_count_by_type(type)
    trains.count { |t| t.type == type }
  end

  class << self
    attr_reader :my_instances

    alias all my_instances
  end
end
