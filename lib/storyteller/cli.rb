require 'storyteller/actions/export'

module Storyteller
  module CLI

    ACTIONS = {
      "export" => ::Storyteller::Actions::Export
    }

    def self.parse(args)
      action = ACTIONS[args.shift]
      if action.nil?
        puts "Unrecognized command"
        exit 1
      end

      # okay, the action exists, then we setup the env
      ::Storyteller.setup

      action.execute(args)
    end

    
  end # CLI
end # Storyteller
