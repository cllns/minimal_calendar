source "https://rubygems.org"

gem "rails", "4.2.0"

# Use postgres as the database for Active Record
gem "pg", "0.17.1"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0",          group: :doc

# Spring speeds up development by keeping your application
# running in the background. Read more: https://github.com/rails/spring
gem "spring",        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"

# Use debugger
# gem 'debugger', group: [:development, :test]

# Below added by sean

# use rack-cache (from config/environments/production.rb)
gem "rack-cache"

# use Font Awesome, for the icons
gem "font-awesome-rails"

# use faker to make some good fake author names and titles (for seeds.rb)
gem "faker", group: :development

group :development, :test do
  # use rspec
  gem "rspec-rails", "~> 3.0"
  # use shoulda (matchers)
  gem "shoulda-matchers", "~> 2.6.2"

  # use factory girls (instead of fixtures)
  gem "factory_girl_rails", "~> 4.4.0"

  # rubocop to make sure we style our code consistently
  gem "rubocop"
end

# fancy datepicker
gem "pickadate-rails"

# let us work with date and time separately
gem "time_splitter"

# lets us use cookies!
gem "jquery-cookie-rails"

# pure-css  (for grid and pretty buttons)
gem "purecss-rails"

# use SASS
gem "sass-rails", "~> 4.0.3"
