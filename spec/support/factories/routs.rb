# frozen_string_literal: true

FactoryBot.define do
  factory :route do
    initialize_with { new(build(:station), build(:station)) }
  end
end
