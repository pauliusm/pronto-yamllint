$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'pronto/yamllint_version'

Gem::Specification.new do |s|
  s.name        = 'pronto-yamllint'
  s.version     = '0.1.0'
  s.date        = '2017-10-25'
  s.summary     = 'Pronto runner for yamllint'
  s.description = 'Enables pronto to check .yaml files using yamllint'
  s.authors     = ['Paulius Mazeika']
  s.email       = 'paulius@chroot.lt'
  s.files       = %w[LICENSE README.md] + Dir.glob('lib/**/*')

  s.homepage    = 'http://rubygems.org/gems/pronto-yamllint'
  s.license     = 'MIT'

  s.requirements << 'yamllint (in PATH)'
  s.add_dependency('pronto', '~> 0.9.0')
end
