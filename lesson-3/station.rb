# frozen_string_literal: true

class Station
  NAME_FORMAT = /\A[А-ЯA-Z][а-яa-z0-9_-]+\z/.freeze

  attr_reader :name, :trains

  @my_instances = []

  class << self
    attr_reader :my_instances

    alias all my_instances
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
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

  def valid?
    validate!
  rescue ValidationError
    false
  end

  def each_train
    trains.each { |t| yield(t) if block_given? }
  end

  private

  def validate!
    raise ValidationError, "Name can't be nil" if name.nil?
    raise ValidationError, "Name can't be empty" if name.length.zero?
    raise ValidationError, 'Name is not valid' if name !~ NAME_FORMAT

    true
  end
end
