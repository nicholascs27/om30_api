source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.8"

gem "bootsnap", require: false

gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave.git', branch: 'master'
gem 'cpf_cnpj'

gem 'figaro'

gem 'grape'
gem 'grape_on_rails_routes'
gem 'grape-active_model_serializers'
gem 'grape-papertrail'

gem 'mina', github: 'mina-deploy/mina'
gem 'mina-multistage', require: false
gem 'mina-whenever'

gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

gem 'ransack', github: 'activerecord-hackery/ransack'

gem 'twilio-ruby', '~> 5.31.1'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "byebug"
  gem "awesome_print"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
  gem 'cpf_faker'
end

group :development do
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
end
