# frozen_string_literal: true

module Accessors
  module ClassMethods
    private

    def attr_accessor_with_history(*names)
      prime_value_to_history(names)
      names.each do |name|
        accessor_with_history(name)
      end
    end

    def strong_attr_acessor(name, klass)
      instance_var_get(name)
      instance_var_set_strong(name, klass)
    end

    def accessor_with_history(name)
      instance_var_get(name)
      instance_var_set_history(name)
      history_method(name)
    end

    def history_method(name)
      define_method("#{name}_history") { history_variables["@#{name}".to_sym] }
    end

    def instance_var_get(name)
      define_method(name) { instance_variable_get("@#{name}") }
    end

    def instance_var_set_history(name)
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set("@#{name}", value)
        history_variables["@#{name}".to_sym].push(value)
      end
    end

    def prime_value_to_history(names)
      singleton_class.define_method :new do |*initial_varibles|
        result = super(*initial_varibles)
        names.each do |name|
          result.public_send("#{name}_history".to_sym).push(result.instance_variable_get("@#{name}"))
        end
        result
      end
    end

    def instance_var_set_strong(name, klass)
      define_method("#{name}=".to_sym) do |value|
        raise ArgumentError, 'Wrong type of argument' unless value.is_a?(klass)

        instance_variable_set("@#{name}", value)
      end
    end
  end

  module InstanceMethods
    private

    def history_variables
      @history_variables ||= Hash.new { |hash, key| hash[key] = [] }
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
