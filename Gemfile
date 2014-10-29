source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '~> 4.1.4'

gem 'awesome_print'
gem 'bcrypt', '~> 3.1.7'
gem 'bitfields'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'bootswatch-rails', github: 'maxim/bootswatch-rails'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.0.0'
gem 'crypt_keeper'
gem 'dalli'
gem 'devise'
gem 'devise-async'
gem 'dotenv-deployment'
gem 'dotenv-rails'
gem 'escape_utils'
gem 'fast_blank'
gem 'ffaker'
gem 'fog'
gem 'foreman', require: false
gem 'friendly_id'
gem 'geocoder'
gem 'gravatar_image_tag'
gem 'hiredis'
gem 'ids_please'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'kaminari'
gem 'kgio'
gem 'mail_view'
gem 'mandrill-api'
gem 'memcachier'
gem 'multi_json'
gem 'oink'
gem 'oj'
gem 'oj_mimic_json'
gem 'paper_trail', '~> 3.0.2'
gem 'pg'
gem 'pg_search'
gem 'pry-rails'
gem 'public_activity', github: 'pokonski/public_activity'
gem 'puma'
gem 'redis', require: ['redis', 'redis/connection/hiredis']
gem 'request-log-analyzer'
gem 'rest-client'
gem 'sanitize'
gem 'sass-rails', '~> 4.0.3'
gem 'sidekiq'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'sinatra', '>= 1.3.0', require: false
gem 'sitemap_generator', github: 'kjvarga/sitemap_generator'
gem 'stamp'
gem 'twitter'
gem 'uglifier', '>= 1.3.0'
gem 'uuidtools'
gem 'whenever', require: false
gem 'sweet-logger'

# Rails 4.2
gem 'rails-html-sanitizer'

group :development, :test do
  gem 'active_record_query_trace', require: false
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'bullet'
  gem 'gem_bench', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'letter_opener'
  gem 'meta_request'
  gem 'rack-livereload'
  gem 'rails-erd'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-bundler', '~> 1.1.3'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma'
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'poltergeist', require: false
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', require: false
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'newrelic_rpm'
  gem 'informant-rails'
end
gem 'airbrake'

group :production, :development do
  gem 'le'
end
