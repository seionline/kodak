# frozen_string_literal: true

source "https://rubygems.org"

ruby "4.0.5"

gem "rails", "~> 8.1.4"
gem "rails-i18n", "~> 8.0"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1"
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "faker", "~> 3.1"
gem "image_processing", "~> 1.2"
gem "aws-sdk-s3", "~> 1.206", require: false

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "rspec-rails", "~> 8.0"
  gem "rubocop-rails-omakase", require: false
  gem "simplecov", "~> 0.22"
end

group :development do
  gem "web-console"
  gem "i18n-tasks", "~> 1.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
