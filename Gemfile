#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.8'

# Javascript library
gem 'jquery-rails'

# Database
# gem 'pg'
# gem 'mysql2'
gem 'sqlite3'

# Design Pattern Practice
# gem 'cells'
# gem 'draper'

# Paginator
# gem 'kaminari'

# Form tool
# gem "simple_form"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'sqlite3'
  gem 'thin'
  gem 'jazz_hands'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-debugger'
  gem 'ffaker'
  gem "spork"
  gem 'spork-rails'
  gem "rspec-rails"
  gem 'factory_girl_rails'
  gem "guard-spork"
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard-rails'
  gem "guard-bundler"
end

group :test do
  if RUBY_PLATFORM =~ /linux/
    gem 'rb-inotify'
    gem 'libnotify'
  end
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rack_session_access'
end
