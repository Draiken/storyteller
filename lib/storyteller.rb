require 'storyteller/dsl'
require 'storyteller/exporters'
require 'yaml'

module Storyteller

  @@output_file = nil
  def self.output_file=(file)
    @@output_file = file
  end

  def self.output_file
    @@output_file
  end

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
    char
  end


end
