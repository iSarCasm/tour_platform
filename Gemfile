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

gem 'jbuilder', '~> 2.5'
gem "turbolinks", "~> 5.0.0", require: false

gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

# User
gem 'devise'

# User Roles
gem 'cancancan', '~> 2.0'

# Human links
gem 'friendly_id', '~> 5.1.0'

# Accessing Controller varaibles in JS (with AJAX calls)
gem 'gon'

# Error Logging and Notifications
gem 'rollbar'

# Images
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

# Data migrations
gem 'data_migrate'

# Reports
gem 'thinreports'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Dashboard
gem 'rails_admin_defaults', git: 'https://github.com/iSarCasm/rails_admin_defaults'
gem 'rails_admin', '~> 1.2'
# gem 'rails_admin_table_field', git: 'https://github.com/iSarCasm/rails_admin_table_field'
gem 'rails_admin_table_field', path: '/home/sarcasm/workspace/tour_eco/rails_admin_table_field'
gem 'rails_admin_list_field', git: 'https://github.com/iSarCasm/rails_admin_list_field'
gem 'rails_admin_compact', '0.1.6', git: 'https://github.com/iSarCasm/rails_admin_compact'

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
  # gem 'binding_of_caller'
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
  # N+1
  gem 'bullet'
  # Memory leaks and benchmarks
  gem 'oink'
  gem 'derailed_benchmarks'
  gem 'stackprof'
  # Schame model annotations
  gem 'annotate', require: false
  # Code style
  gem 'rubocop', '~> 0.49.1', require: false
  # Dump dev DB to seed
  gem 'seed_dump'
  # Start Server in development
  gem 'foreman', require: false
  # Generate DB relational image
  gem 'rails-erd', require: false # Requires GraphViz in path
end

group :test do
  # Tests
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver', '<= 2.53'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'faker'
  gem 'simplecov', require: false
  gem "codeclimate-test-reporter", "~> 1.0.0"
end

group :production do
  # Asset Pipeline
  gem 'rails_12factor'
  # Request speed
  gem "skylight"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
