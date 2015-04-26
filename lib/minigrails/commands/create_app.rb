require 'fileutils'

module Minigrails
  module Command
    class CreateApp
      include ::Minigrails::TaskHelper

      def run(config)
        application_name = config[:name]
        FileUtils.mkdir_p "#{application_name}/grails-app/conf"
        FileUtils.mkdir_p "#{application_name}/grails-app/controllers"

        create_files(config)
      end

      private
      def create_files(config)
        application_name = config[:name]
        generate_file(File.join(TEMPLATE_DIR, 'urlmappings.rb.liquid'),
                      "#{application_name}/grails-app/conf/urlmappings.rb",
                      config)
      end
    end
  end
end
