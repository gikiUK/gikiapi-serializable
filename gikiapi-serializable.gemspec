version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |spec|
  spec.name          = 'gikiapi-serializable'
  spec.version       = version
  spec.author        = 'Lucas Hosseini'
  spec.email         = 'lucas.hosseini@gmail.com'
  spec.summary       = 'Conveniently serialize JSON API resources.'
  spec.description   = 'Powerful DSL for building resource classes - ' \
                       'efficient and flexible rendering.'
  spec.homepage      = 'https://github.com/gikUk/gikiapi-serializable'
  spec.license       = 'MIT'

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.require_path  = 'lib'

  spec.add_dependency 'jsonapi-renderer', '~> 0.2.0'

  spec.add_development_dependency 'benchmark-ips'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'simplecov'
end
