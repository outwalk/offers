ENV['RAILS_ENV'] ||= 'test'
if ENV['RCOV'].to_s.downcase == 'true'
  require 'simplecov'
  SimpleCov.start 'rails'
end
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/rspec'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

if ENV['HEADLESS'].to_s.downcase == 'true'
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include LoginHelper, type: :feature
  config.include Devise::TestHelpers, type: :controller
  config.extend DeviseControllerMacros, type: :controller
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.order = :random
  config.default_formatter = :doc if config.files_to_run.one?

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
    DatabaseCleaner.start
    FactoryGirl.reload
    I18n.locale = 'uk'
    MetroStation.instance_variable_set(:@district_ids, nil)
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
