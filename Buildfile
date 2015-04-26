repositories.remote << 'http://repo1.maven.org/maven2/'

define 'minigrails' do
  project.version = '0.1.0'
  package :jar

  compile.with 'org.eclipse.jetty:jetty-server:jar:9.3.0.M2',
               'org.eclipse.jetty:jetty-servlet:jar:9.3.0.M2',
               'org.eclipse.jetty:jetty-webapp:jar:9.3.0.M2',
               'org.eclipse.jetty:jetty-util:jar:9.3.0.M2'
end
