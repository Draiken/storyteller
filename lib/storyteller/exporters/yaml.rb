require 'yaml'

module Storyteller
  module Exporters
    class YAML < Base

      def export(character, options = {})
        hash = Hash.new
        hash[:name] = character.name

        hash[:attributes] = Hash.new.tap do |h|
          ::Storyteller::Models::Character.main_attributes.each do |attr|
            h[attr] = character.send(attr)
          end
        end

        File.open( filename(character, options[:output_file]), 'w' ) do |out|
          ::YAML.dump( hash, out )
        end
      end

      def filename(character, output_file)
        output_file || "#{character.name.downcase.gsub(/\s+/, '_')}.yaml"
      end

    end # YAMLExporter < Base
  end # Exporters
end # Storyteller

::Storyteller::Exporters.register_exporter('yaml', ::Storyteller::Exporters::YAML)
