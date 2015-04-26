Gem::Specification.new do |s|
  s.name = 'minigrails'
  s.version = '0.1.0'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['S\u{e9}bastien Le Callonnec']
  s.date = '2015-04-26'
  s.description = 'Minigrails'
  s.summary = 'Minigrails'
  s.email = 'sebastien@weblogism.com'
  s.executables = ['minigrails']
  s.platform = 'java'

  files = Dir.glob("lib/**/*.rb") +
          Dir.glob("lib/**/*.liquid") +
	      Dir.glob("src/**/*.{java}") +
          Dir.glob("lib/**/*.jar")

  s.files = files
  s.add_development_dependency 'rake-compiler'
  s.add_development_dependency 'buildr'
end
