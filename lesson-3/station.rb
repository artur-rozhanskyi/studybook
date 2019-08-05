# frozen_string_literal: true

require_relative 'validatable'

class Station
  include Validatable

  NAME_FORMAT = /\A[А-ЯA-Z][а-яa-z0-9_-]+\z/.freeze

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, NAME_FORMAT

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

  def each_train
    trains.each { |t| yield(t) if block_given? }
  end
end
