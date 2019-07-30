# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    name { 'Station1' }

    initialize_with { new(name) }
    trait :with_train do
      after(:build) { |station| station.receive_train(build(:train)) }
    end
  end
end
