module Storyteller

  module DSL

    def self.parse(code)
      dsl = Parser.new
      char = dsl.instance_eval(code.to_s)
      puts char.inspect
      char
    end

    class Parser
      def char(name, &block)
        char = Character.new
        char.name = name
        char.instance_eval(&block)
        char
      end
    end

    class Character

      attr_accessor :name

      # attributes
      attr_accessor :str, :dex, :sta, :cha, :man, :app, :per, :int, :wit
  
      # skills
      #attr_accessor :brawl

      # spheres
      attr_accessor :prime, :forces

      def brawl=(val)
        puts "LOLOLOL"
        @brawl = val
      end

      def brawl(val = nil)
        @brawl ||= val
      end

      def lala
        puts self
        puts self.methods.grep /\=/
        @brawl = 5
        puts "lala"
      end
      
      def attr(*args)
        str, dex, sta  = args[0]
        char, man, app = args[1]
        per, int, wit  = args[2]
      end

      def skills(&block)
        puts block.inspect
        self.instance_exec &block
      end

      def spheres(&block)
        self.instance_eval &block
      end
    end

  end
end
