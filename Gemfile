# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem "minitest-reporters", "~> 1.3"
  gem "color_pound_spec_reporter", "~> 0.0.9"
  gem 'minitest'
end

group :development do
  gem 'rake'
  gem "solargraph"
  gem "awesome_print", "~> 1.8"
  gem "pry", "~> 0.12.2"
end

gem "pry-coolline", "~> 0.2.5", :group => :development
gem "pry-byebug", "~> 3.7", :group => :development
