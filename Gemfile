source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'jquery-rails'
gem 'paperclip'
gem 'will_paginate', :git => "git://github.com/mech/will_paginate.git"
gem 'mimemagic'
gem 'thin'
gem 'RedCloth'
gem 'rdiscount'

# Authentication
gem 'devise', '1.5.3'

# Caching
gem 'dalli'

# Background process
gem 'resque'
gem 'resque-pool'

# Reporting
gem 'spreadsheet'
gem 'panmind-rtf', '0.4.1'
gem 'prawn'

group :development do
  # For IRB
  gem 'wirble'
  gem 'hirb' # hirb-unicode
  gem 'awesome_print', :require => 'ap'
  gem 'quiet_assets'

  gem 'brakeman' # For general security vulnerability. Run using `brakeman -o sec.html`
  gem 'sextant' # Point URL to /rails/routes, but in development only
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov', :require => false      # Do not require or else __Uninitialized constant SimpleCov__ issues
  gem 'simplecov-rcov', :require => false # Play nice with Jenkins
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
