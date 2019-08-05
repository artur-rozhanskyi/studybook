# frozen_string_literal: true

module Validatable
  module ClassMethods
    def validates
      @validates ||= []
    end

    def validate(*args)
      validates << args
    end
  end

  module InstanceMethods
    def errors
      @errors ||= Hash.new { |hash, key| hash[key] = {} }
    end

    def find_rule(*args)
      arg_name = args[0][0]
      {
        presence: { message: "#{arg_name.capitalize} can't be nil",
                    check: "public_send(:#{arg_name}).nil?" },
        type: { message: "#{arg_name.capitalize} wrong type",
                check: "public_send(:#{arg_name}).class != #{args[0][2]}" },
        format: { message: "#{arg_name.capitalize} is not valid",
                  check: "public_send(:#{arg_name}) !~ /#{args[0][2]}/" }
      } [args[0][1]]
    end

    def validate!
      self.class.validates.each do |row|
        check_method(row[0], row[1], find_rule(row))
      end
    end

    def valid?
      errors.clear
      validate!
      return true if errors.empty?

      false
    end

    def check_method(name, check, rule)
      errors[name] = { check => rule[:message] }.merge(errors[name]) if instance_eval(rule[:check])
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
