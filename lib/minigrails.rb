$:.unshift File.dirname(__FILE__)

require 'minigrails/version'
require 'minigrails.jar'

require 'javax.servlet-api-3.1.0.jar'
require 'jetty-http-9.3.0.M2.jar'
require 'jetty-io-9.3.0.M2.jar'
require 'jetty-security-9.3.0.M2.jar'
require 'jetty-server-9.3.0.M2.jar'
require 'jetty-servlet-9.3.0.M2.jar'
require 'jetty-util-9.3.0.M2.jar'
require 'jetty-webapp-9.3.0.M2.jar'
require 'jetty-xml-9.3.0.M2.jar'

require 'minigrails/minigrails'
require 'minigrails/commands'
