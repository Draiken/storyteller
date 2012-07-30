require 'yaml'

module Storyteller
  module Exporters
    class YAML < Base

      def export(character)
        hash = Hash.new
        hash[:name] = character.name

        hash[:attributes] = Hash.new.tap do |h|
          ::Storyteller::Models::Character.main_attributes.each do |attr|
            h[attr] = character.send(attr)
          end
        end

        File.open( "#{character.name.downcase.gsub(/\s+/, '_')}.yaml", 'w' ) do |out|
          ::YAML.dump( hash, out )
        end
      end

    end # YAMLExporter < Base
  end # Exporters
end # Storyteller

::Storyteller::Exporters.register_exporter('yaml', ::Storyteller::Exporters::YAML)
