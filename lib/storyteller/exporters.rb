module Storyteller
  module Exporters

    @@exporters = Hash.new
    
    def self.for(format)
      exporter = @@exporters[format]
      raise "No formatter found for #{format}" if exporter.nil?
      exporter.new
    end

    def self.register_exporter(format, exporter)
      puts "Registering formatter for #{format}"
      @@exporters[format] = exporter      
    end

  end # Exporters
end # Storyteller

Dir["lib/storyteller/exporters/**.rb"].each do |exporter|
  require exporter
end
