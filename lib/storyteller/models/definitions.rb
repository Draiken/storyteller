module Storyteller
  module Models
    module Definitions

      def self.included(base)
        base.class_eval do

          def self.define_attribute(*attrs)
            attrs.each do |a|
              puts "Defining attribute #{a}"
              self.class_eval <<-___
          def #{a}(val = nil)
            @#{a} = val unless val.nil?
            @#{a}
          end
            ___
            end
          end

          def self.define_section(*args)
            args.each do |arg|
              self.class_eval <<-___
          def #{arg}(&block)
            instance_eval &block
          end
              ___
            end
          end

          def self.main_attributes
            @@main_attributes
          end

          def self.main_attributes=(val)
            @@main_attributes = val
          end
        end
      end
    end # Models
  end # Definitions
end # Storyteller
