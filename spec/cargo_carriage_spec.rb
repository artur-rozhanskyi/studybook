# frozen_string_literal: true

describe CargoCarriage do
  let(:cargo_carriage) { build(:cargo_carriage, :with_occupied_capacity) }

  describe '#fill' do
    it { expect { cargo_carriage.fill(20) }.to change(cargo_carriage, :occupied_capacity).by(20) }
  end

  describe '#available_capacity' do
    it do
      available_capacity = cargo_carriage.capacity - cargo_carriage.occupied_capacity
      expect(cargo_carriage.available_capacity).to eq(available_capacity)
    end
  end
end
