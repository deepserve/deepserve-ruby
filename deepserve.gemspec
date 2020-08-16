Gem::Specification.new do |s|
  s.name        = 'deepserve'
  s.version     = '1.0.0'
  s.date        = '2010-04-28'
  s.summary     = "Deepserve.ai deploys ad scales machine learning models in production"
  s.description = "Deploy and host deep learning neural networks in one command with Deepserve.ai"
  s.authors     = ["Jeff Wells"]
  s.email       = 'jeff@deepserve.ai'
  s.files       = ["lib/deepserve.rb"]
  s.homepage    = 'https://rubygems.org/gems/deepserve'

  s.add_runtime_dependency 'rest-client', '~> 2.1'
  s.add_runtime_dependency 'graphql-client', '~> 2.1'
  gem 'graphql-client'


  s.add_development_dependency('rspec', '~> 3.0')
  s.add_development_dependency('pry', '~> 0')
  s.add_development_dependency('pry-doc', '~> 0')
  s.add_development_dependency('rdoc', '>= 2.4.2', '< 6.0')
  s.add_development_dependency('rubocop', '~> 0.49')

  s.required_ruby_version = '>= 2.0.0'
  s.license       = 'MIT'
end
