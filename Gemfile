source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'pg' # for heroku
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'protected_attributes'
gem 'app_config'

# group :assets do
gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# end

# group :(o)auth do
gem 'devise'
gem 'therubyracer'
gem 'omniauth'
gem 'omniauth-vkontakte'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google'
# end

# group :features do
gem 'slim-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'devise-bootstrap-views'
# end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'guard-rspec'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
end
