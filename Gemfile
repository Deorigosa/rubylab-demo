# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

gem 'aasm'
gem 'active_model_serializers'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'faraday'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'sidekiq'
gem 'slack-ruby-client'

group :development, :test do
  gem 'listen'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'vcr'
end

group :test do
  gem 'webmock'
end
