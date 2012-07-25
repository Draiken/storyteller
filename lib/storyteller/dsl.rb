class Proc #:nodoc:
  def bind(object)
    block, time = self, Time.now
    object.class_eval do
      method_name = "__bind_#{time.to_i}_#{time.usec}"
      define_method(method_name, &block)
      method = instance_method(method_name)
      remove_method(method_name)
      method
    end.bind(object)
  end
end


module Storyteller

  module DSL

    def self.parse(code)
      dsl = Parser.new
      puts code
      char = dsl.instance_eval(code.to_s)
      char
    end

    class Parser
      def char(name, &block)
        char = Character.new
        char.name = name
        block.bind char
        char.instance_eval(&block)
        char
      end
    end

    class Character

      attr_accessor :name

      # attributes
      attr_accessor :str, :dex, :sta, :cha, :man, :app, :per, :int, :wit
  
      # skills
      attr_accessor :brawl

      # spheres
      attr_accessor :prime, :forces
      
      def attr(*args)
        str, dex, sta  = args[0]
        char, man, app = args[1]
        per, int, wit  = args[2]
      end

      def skills(&block)
        instance_eval &block
        #new_self = block.binding.eval("self")
        #Proc.new { new_self.instance_eval &block }
      end

      def spheres(&block)
        instance_eval &block
        #block.bind(self)
        #block.call
      end
    end

  end
end
