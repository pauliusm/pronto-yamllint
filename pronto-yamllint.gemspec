$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'pronto-yamllint'
  s.version     = '0.2.0'
  s.date        = '2020-02-17'
  s.summary     = 'Pronto runner for yamllint'
  s.description = 'Enables pronto to check .yaml files using yamllint'
  s.authors     = ['Paulius Mazeika']
  s.email       = 'paulius@chroot.lt'
  s.files       = %w[LICENSE README.md] + Dir.glob('lib/**/*')

  s.homepage    = 'http://rubygems.org/gems/pronto-yamllint'
  s.license     = 'MIT'

  s.requirements << 'yamllint (in PATH)'
  s.add_dependency('pronto', '~> 0.11.0')
end
