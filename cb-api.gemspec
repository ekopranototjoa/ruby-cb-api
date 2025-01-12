$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'cb/version'

Gem::Specification.new do |s|
  s.name        = 'cb-api'
  s.version     = Cb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'The CareerBuilder.com Niche and Consumer Development teams'
  s.email       = 'opensource@careerbuilder.com'
  s.homepage    = 'http://developer.careerbuilder.com'
  s.summary     = 'Ruby wrapper around Careerbuilder Public API.'
  s.description = 'Ruby wrapper for Careerbuilder Public API.'
  s.license     = 'Apache-2.0'

  s.files        = Dir['{lib}/**/*', 'LICENSE', '*.md']
  s.require_path = 'lib'

  s.add_dependency 'httparty', '~> 0.11'
  s.add_dependency 'json', '~> 2.3', '>= 2.3.0'
  s.add_dependency 'nori', '~> 2.2'
  s.add_dependency 'nokogiri', '~> 1.0'

  s.add_development_dependency 'rake', '>= 0.8.7'
  s.add_development_dependency 'webmock', '~> 1.9'
  s.add_development_dependency 'simplecov', '>= 0.7.1'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'rdoc', '~> 6.4'
  s.add_development_dependency 'rspec-pride', '~> 3.0'
  s.add_development_dependency 'pry', '0.9.12.1'
  s.add_development_dependency 'rb-readline', '~> 0.5.0'
  s.add_development_dependency 'codeclimate-test-reporter'
end
