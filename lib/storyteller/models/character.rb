require 'storyteller/models/definitions'

module Storyteller

  module Models

    class Character

      include Definitions

      def self.setup(base)
        base['attributes'].each do |attr|
          define_attribute attr.downcase
        end
        self.main_attributes = base['attributes'].map(&:downcase).map(&:to_sym)

        base['sections'].each do |sec|
          define_section sec.downcase
        end
      end

      attr_accessor :name

      # skills
      define_attribute :brawl

      # spheres
      define_attribute :prime, :forces

      def attr(*args)
        Character.main_attributes.each do |attr|
          self.send(attr, args.shift)
        end
      end
      alias :attributes :attr

    end
  end # Models

end # Storyteller
