
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require "shoulda/matchers"
require 'webmock/rspec'
require 'simplecov'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before(:suite) do
    FactoryBot.reload
  end

  FactoryBot::SyntaxRunner.class_eval do
    include RSpec::Mocks::ExampleMethods
  end

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

SimpleCov.start
