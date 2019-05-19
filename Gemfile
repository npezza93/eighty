# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.3"

gem "babel-transpiler"
gem "devise"
gem "haml-rails"
gem "pg"
gem "pry-rails"
gem "puma"
gem "rails", "< 5.2"
gem "turbolinks", "~> 5"

gem "jquery-rails"
gem "sass-rails"
gem "sprockets", "~> 4.0.0beta4"
gem "uglifier"

# Image uploading
gem "carrierwave"
gem "cloudinary"
gem "jquery-fileupload-rails"

# Markdown helpers
gem "redcarpet"
gem "rouge"
gem "sanitize"
gem "truncate_html"

group :production do
  gem "sendgrid-ruby"
end

group :test do
  gem "codeclimate-test-reporter"
  gem "simplecov", require: false
end

group :development, :test do
  gem "haml_lint"
  gem "letter_opener"
  gem "rubocop"
  gem "rubocop-performance"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen"
  gem "web-console"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
