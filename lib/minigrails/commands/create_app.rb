require 'fileutils'

module Minigrails
  module Command
    class CreateApp
      def run(config)
        application_name = config[:name]
        FileUtils.mkdir_p "#{application_name}/grails-app/conf"
      end      
    end
  end
end
