module Minigrails
  class Minigrails
    def run(options)
      case options[:command]
      when 'create-app'
        create_app = Command::CreateApp.new
        create_app.run(options)
      when 'run-app'
        puts 'Running...'
      else
        raise ArgumentError, "#{options[:command]} is not a valid command."
      end
    end
  end
end
