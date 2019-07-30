# frozen_string_literal: true

FactoryBot.define do
  factory :passenger_carriage do
    seats { 52 }
    initialize_with { new(seats) }
    trait :with_occupied_seats do
      after(:build) { |p_carriage| 10.times { p_carriage.take_seat } }
    end
  end
end
