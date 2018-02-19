source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'font-awesome-rails'
gem 'devise-bootstrap-views'
gem 'twitter-bootstrap-rails'
gem 'devise'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', platforms: :ruby
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'gentelella-rails'
gem 'jquery-ui-rails'
gem 'cocoon'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jquery-datatables-rails'
gem 'seed_dump'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg', '~> 0.11'
end

