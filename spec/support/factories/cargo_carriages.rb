# frozen_string_literal: true

FactoryBot.define do
  factory :cargo_carriage do
    capacity { 100 }
    initialize_with { new(capacity) }
    trait :with_occupied_capacity do
      after(:build) { |c_carriage| c_carriage.fill(50) }
    end
  end
end
