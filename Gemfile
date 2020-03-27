source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "geocoder"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "paperclip"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.1"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13.0"
  gem "factory_bot_rails"
  gem "launchy"
  gem "pry"
  gem "rspec-rails"
  gem "selenium-webdriver"
end

group :development do
  gem "faker", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "shoulda-matchers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
