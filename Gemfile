source 'https://rubygems.org'
ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# A Reverse Proxy for Rack
gem "rack-reverse-proxy", :require => "rack/reverse_proxy"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# gem 'jquery-modal-rails'


#gem "non-stupid-digest-assets"
gem 'pg'
gem 'rails_12factor', group: :production

gem "devise"
gem "rails_admin", "~> 0.5.0"
gem "paperclip", "~> 3.0"

# api gem
gem 'twitter'
gem 'aws-s3', :require => 'aws/s3'
gem 'aws-sdk'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'bitpay-client', :require => 'bitpay'
gem 'gibbon', :git=> 'https://github.com/amro/gibbon.git' 

gem 'rack-superfeedr'
gem 'acts-as-taggable-on'
gem 'rails_admin_tag_list'
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]




group :test,:development do
	gem 'debugger'
end

group :test do
	gem 'rspec-rails' 
	gem 'factory_girl_rails' 
  gem 'faker' 
  gem 'capybara' 
  gem 'guard-rspec' 
  gem 'launchy' 
  gem 'stripe-ruby-mock', '>= 1.8.7.4'
end 