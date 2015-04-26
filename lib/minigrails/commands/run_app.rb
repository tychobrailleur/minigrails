java_import 'minigrails.conf.Config'
java_import 'minigrails.jetty.StartServer'

module Minigrails
  module Command
    class RunApp
      include ::Minigrails::TaskHelper
      
      def run(config)
        conf = Config.new
        conf.serverPort = 8080

        package_webapp(config)
        start_server(conf)
      end

      private
      def start_server(config)
        run_app = StartServer.new
        run_app.start(config)
      end

      def package_webapp(config)
        FileUtils.mkdir_p('target/webapp/WEB-INF')
        FileUtils.mkdir_p('target/webapp/WEB-INF/lib')
        generate_file(File.join(TEMPLATE_DIR, 'web.xml.liquid'),
                      'target/webapp/WEB-INF/web.xml',
                      config)

        FileUtils.cp("#{ENV['MINIGRAILS_HOME']}/lib/minigrails.jar", 'target/webapp/WEB-INF/lib')
      end
    end
  end
end
