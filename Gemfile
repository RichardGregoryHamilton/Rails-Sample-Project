source 'https://rubygems.org'

gem 'rails', '4.0.4'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
end

group :production do
  gem 'pg', '0.17.1' # Use postgres in production, because Heroku
  gem 'rails_12factor' # Enable static asset serving on heroku
  gem 'heroku-deflater', :group => :production
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'sprockets-rails', '~> 2.0.0'
gem 'bootstrap-sass', '2.3.2.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', require: false
end

gem 'bcrypt', '~> 3.1.7'

gem 'mail_form'
gem 'simple_form'

gem 'yui-compressor', '~> 0.12.0'
gem 'rack-zippy'
gem 'delayed_job_active_record'