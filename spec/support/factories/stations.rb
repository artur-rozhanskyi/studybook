# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    name { 'Station1' }

    initialize_with { new(name) }
  end
end
