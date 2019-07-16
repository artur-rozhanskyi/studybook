# frozen_string_literal: true

module ObjectAdder
  private

  def create_obj_add_to_array(hash = {})
    if find(hash[:array], hash[:attr_name], hash[:input]) || hash[:input].empty?
      puts ERROR_NEW_INPUT_MESSAGE
    else
      hash[:class_name].new(hash[:input]).tap { |obj| hash[:array] << obj }
    end
  end

  def find(array, attr_name, input)
    array.find { |e| e.instance_variable_get("@#{attr_name.to_sym}") == input }
  end
end
