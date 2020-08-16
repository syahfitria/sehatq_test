source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql2 as the database for Active Record
gem 'mysql2', '~> 0.5.2'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'awesome_print'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Authentication
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'devise-jwt', '~> 0.5.9'

# Pagination
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'carrierwave', '~> 1.0'
gem 'api-pagination', '~> 4.8', '>= 4.8.2'

# Push notification using one_signal
gem 'one_signal', '~> 1.2'

# Rest Client
gem 'rest-client', '~> 2.0', '>= 2.0.2'

# Exception Notification
gem 'exception_notification', '~> 4.3'
gem 'activerecord-import', '~> 1.0', '>= 1.0.2'

group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

gem 'omniauth-google-oauth2'