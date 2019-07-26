# frozen_string_literal: true

module ObjectFinder
  private

  def find(array, attr_name, input)
    raise 'This object already exists' if array.find { |e| e.public_send(attr_name) == input }
  end
end
