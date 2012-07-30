module Storyteller
  module Exporters
    class Base

      def export(character)
        raise "Don't know how to export the character"
      end

      def import(character)
        raise "Don't know how to import the character"
      end
      
    end # Base
  end # Exporters
end # Storyteller
