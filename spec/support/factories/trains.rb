# frozen_string_literal: true

FactoryBot.define do
  factory :train do
    number { '123qw' }

    initialize_with { new(number) }

    factory :cargo_train, parent: :train, class: 'CargoTrain' do
      trait :with_carriage do
        after(:build) { |p_train| p_train.hook_carriage(CargoCarriage.new) }
      end
    end
    factory :passenger_train, parent: :train, class: 'PassengerTrain' do
      trait :with_carriage do
        after(:build) { |p_train| p_train.hook_carriage(PassengerCarriage.new) }
      end
    end
  end
end
