module Storyteller
  module Actions
    class Export

      attr_accessor :format, :output_file, :file, :options

      def self.execute(args)
        new.execute(args)
      end

      def execute(args)
        parse_options(args)
        self.file = args.shift
        self.format = args.shift
        unless file && format
          puts @parser.help 
          exit
        end
        char = Storyteller.parse_file(file)
        export(char, self.options)
      end

      def export(char, options)
        puts "Exporting character to format #{format}"
        exporter = Exporters.for(format)

        exporter.export(char, options)
      end

      def parse_options(args)
        self.options = {}
        @parser = OptionParser.new do |o|
          o.banner = "Usage: teller export FILE FORMAT [options]"

          o.on("-o", "--output FILE", "Output file") do |file|
            self.options[:output_file] = file
          end
        end
        @parser.parse!(args)
      end
      
    end # Export
  end # Actions
end # Storyteller
