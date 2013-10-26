source 'https://rubygems.org'

gem 'rails',                 '4.0.0'
gem 'sqlite3'
gem 'sass-rails',            '~> 4.0.0'
gem 'uglifier',              '>= 1.3.0'
gem 'coffee-rails',          '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder',              '~> 1.2'
gem 'decent_exposure',       github: 'voxdolo/decent_exposure'
gem 'bootstrap-sass'

group :doc do
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails',         github: 'rspec/rspec-rails', branch: 'records-in-rails-4'
  gem 'factory_girl_rails',  '4.2.1'
end

group :test do
  gem 'capybara',            '2.1.0'
  gem 'database_cleaner',    github: 'bmabey/database_cleaner'
  gem 'simplecov',           require: false
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'thin'
end
