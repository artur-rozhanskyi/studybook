# frozen_string_literal: true

describe PassengerCarriage do
  let(:passenger_carriage) { build(:passenger_carriage, :with_occupied_seats) }

  describe '#take_seat' do
    it { expect { passenger_carriage.take_seat }.to change(passenger_carriage, :occupied_seats).by(1) }
  end

  describe '#available_seats' do
    it do
      available_seats = passenger_carriage.seats - passenger_carriage.occupied_seats
      expect(passenger_carriage.available_seats).to eq(available_seats)
    end
  end
end
