lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'rom/seed/version'

Gem::Specification.new do |spec|
  spec.name        = 'rom-seed'
  spec.version     = ROM::Seed::VERSION
  spec.licenses    = ['MIT']
  spec.authors     = ['Aaron Barthel']
  spec.email       = ['aaron.barthel@live.ca']
  spec.homepage    = 'http://github.com/abrthel/rom-seed'
  spec.summary     = 'some description'
  spec.description = 'some description'

  spec.require_path = ['lib']
  spec.files        = Dir['README.md', 'lib/**/*']

  spec.add_dependency 'rom',             '~> 4.0.0'
  spec.add_dependency 'dry-core',        '~> 0.3.3'
  spec.add_dependency 'dry-struct',      '~> 0.3.1'
  spec.add_dependency 'dry-types',       '~> 0.12.0'
  spec.add_dependency 'dry-initializer', '~> 2.2.0'
  spec.add_dependency 'dry-equalizer',   '~> 0.2'

  spec.add_development_dependency 'rom-sql', '~> 2.0.0'
  spec.add_development_dependency 'rake',    '~> 11.2'
  spec.add_development_dependency 'rspec',   '~> 3.7'
end
