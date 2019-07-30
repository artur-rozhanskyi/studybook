# frozen_string_literal: true

FactoryBot.define do
  factory :route do
    initialize_with { new(build(:station, name: 'Station1'), build(:station, name: 'Station2')) }
    trait :with_mediate_station do
      after(:build) { |route| route.add_mediate_station(0, build(:station, name: 'Station3')) }
    end
  end
end
