source 'https://rubygems.org'

ruby '2.3.1'
#ruby-gemset=tour_platform

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'


# Dashboard
gem 'rails_admin', '~> 1.2'

# Notifications
gem 'toastr-rails'

# User
gem 'devise'

# User Roles
gem 'cancancan', '~> 2.0'

# Human links
gem 'friendly_id', '~> 5.1.0'

# Images
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

group :development, :test do
  # Debug
  gem 'pry-byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Debug
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'
  gem 'binding_of_caller'
  # Security
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  # Code style
  gem 'rubycritic', require: false
  gem 'rails_best_practices', require: false
  # Guard
  gem 'guard-rspec', require: false
  # Rake
  gem "erb2haml"
end

group :test do
  # Tests
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'faker'
  gem 'simplecov', require: false
  gem "codeclimate-test-reporter", "~> 1.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
