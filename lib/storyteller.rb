require 'storyteller/dsl'
require 'storyteller/exporters'
require 'yaml'

module Storyteller

  def self.setup
    @@base = ::YAML.load_file('sheets/base.yml')

    setup_character
  end

  def self.setup_character
    Models::Character.setup(@@base)
  end

  def self.parse_file(file)
    code = File.read(file)
    char = Storyteller::DSL.parse(code)
    puts char.inspect
    char
  end

  def self.export(char, format)
    puts "Exporting character to format #{format}"
    exporter = Exporters.for(format)

    exporter.export(char)
  end

end
