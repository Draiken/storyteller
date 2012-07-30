require 'storyteller/models/character'

module Storyteller

  class DSL

    class << self
      def parse(code)
        dsl = new
        char = dsl.instance_eval(code.to_s)
        char
      end
    end


    def char(name, &block)
      char = Models::Character.new
      char.name = name
      char.instance_eval(&block)
      char
    end

  end
end
