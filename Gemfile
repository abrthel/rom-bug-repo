source 'https://rubygems.org'

gemspec

group :test do
  gem 'inflecto'
  gem 'rspec'
  gem 'simplecov', platforms: [:mri, :mswin, :x64_mingw, :mingw]
end

group :tools do
  gem 'byebug', platforms: [:mri, :mswin, :x64_mingw, :mingw]
  gem 'dotenv'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'mutant'
  gem 'mutant-rspec'
  gem 'pry'
  gem 'pry-byebug'
end

group :windows do
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

group :databases do
  gem 'pg'
  gem 'sqlite3'
end
