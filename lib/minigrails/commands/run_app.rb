java_import 'minigrails.conf.Config'
java_import 'minigrails.jetty.StartServer'

module Minigrails
  module Command
    class RunApp
      def run(config)
        conf = Config.new
        conf.serverPort = 8080

        run_app = StartServer.new
        run_app.start(conf)
      end
    end
  end
end
