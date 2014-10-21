$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'hugebag/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hugebag'
  s.version     = Hugebag::VERSION
  s.authors     = ['Alex Man']
  s.email       = ['alex@hugebag.com']
  s.homepage    = 'http://www.hugebag.com/'
  s.summary     = 'Rails helper methods for views and migrations'
  s.description = 'Rails helper methods for views and migrations'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 3.2.8'
end
