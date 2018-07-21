source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'pg'
gem 'pry-rails'
gem 'figaro'
gem 'config'
gem 'interactor', '~> 3.0'
gem 'sorcery'
gem 'sidekiq'
# gem 'dry-validation'
gem 'hanami-validations'
# gem 'bootsnap', '>= 1.1.0', require: false

gem 'multi_json'
gem 'oj'
gem 'representable'

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'airborne', github: 'brooklynDev/airborne'
  gem 'rspec_api_documentation'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.58', require: false
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
end
