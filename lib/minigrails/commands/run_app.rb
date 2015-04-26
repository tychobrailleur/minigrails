java_import 'minigrails.conf.Config'
java_import 'minigrails.jetty.StartServer'

require 'jruby/jrubyc'

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
        FileUtils.mkdir_p('target/webapp/WEB-INF/classes')
        FileUtils.mkdir_p('target/webapp/WEB-INF/config')
        generate_file(File.join(TEMPLATE_DIR, 'web.xml.liquid'),
                      'target/webapp/WEB-INF/web.xml',
                      config)

        options = { javac: true,
                    target: 'target/webapp/WEB-INF/classes',
                    basedir: Dir.pwd,
                    classpath: [],
                    sha1: false,
                    prefix: '',
                    handles: false,
                    java: false,
                    verbose: true,
                    javac_options: [] }
        
        JRuby::Compiler::compile_files_with_options([ 'grails-app/conf/urlmappings.rb' ], options)
        
        FileUtils.cp("#{ENV['MINIGRAILS_HOME']}/lib/minigrails.jar", 'target/webapp/WEB-INF/lib')
        FileUtils.cp("#{ENV['MINIGRAILS_HOME']}/lib/jruby-complete-9.0.0.0.pre1.jar", 'target/webapp/WEB-INF/lib')
        FileUtils.cp("#{ENV['MINIGRAILS_HOME']}/lib/commons-io-2.4.jar", 'target/webapp/WEB-INF/lib')
      end
    end
  end
end
