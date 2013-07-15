source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use Zurb Foundation for Responsiveness
gem "zurb-foundation", "~> 4.2.1"

# Use slim for templating engine
gem "slim-rails", "~> 2.0.1"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails", "~> 3.0.4"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# Omniauth
gem "omniauth-twitter", "~> 0.0.17"
gem "omniauth-facebook", "~> 1.4.1"
gem "omniauth-google-oauth2", "~> 0.2.0"

# Authentication
gem "devise", "~> 3.0.0.rc"
gem "devise_invitable", github: 'scambra/devise_invitable'

# Administration - Temporary github refs until rails 4 compatible releases
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack',            branch: 'rails-4'
gem 'activeadmin',         github: 'gregbell/active_admin', branch: 'rails4'
gem 'formtastic',          github: 'justinfrench/formtastic'

# Mailers
gem "aws-ses", "~> 0.5.0"

# Functionality
gem "acts-as-taggable-on", "~> 2.4.1"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem "rspec-rails", "~> 2.13.2"
  gem "shoulda", "~> 3.5.0"
  
  # Capybara and Poltergeist
  gem "capybara", "~> 2.1.0"
  gem "poltergeist", "~> 1.3.0"
  gem "launchy", "~> 2.3.0"
  
  #Factory Girl instead of Fixtures
  gem "factory_girl_rails", "~> 4.0"
  
  gem 'debugger'
end

group :development do
  #Guard Goodies
  gem "guard-bundler", "~> 1.0.0"
  gem "guard-rspec", "~> 3.0.2"
  
  #Spork and related guard
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  
  # Guard and LiveReload - Install LiveReload Chrome Extension as well
  gem "guard-livereload", "~> 1.4.0"
  gem "growl", "~> 1.0.3"

  # Better Errors and Rails Panel - Install RailsPanel Chrome Extension as well
  gem "better_errors", "~> 0.9.0"
  gem "binding_of_caller", "~> 0.7.2"
  gem "meta_request", "~> 0.2.6"
  
  # Quiet assets turn off rails assets log
  gem "quiet_assets", "~> 1.0.2"
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use puma as the app server
gem 'puma'

# Coverage
gem 'coveralls', require: false

# New Relic
gem "newrelic_rpm", "~> 3.6.4.122"

group :production do
  # For Heroku
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development