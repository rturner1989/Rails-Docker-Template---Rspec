# frozen_string_literal: true

# spec/support/database_cleaner.rb
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    # :rack_test driver's Rack app under test shares database connection
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    # :selenium driver is run in a different process
    DatabaseCleaner.strategy = if driver_shares_db_connection_with_specs
                                 :transaction
                               else
                                 :truncation
                               end
  end

  config.before(:each, type: :system) do
    # System tests are run in a different process, so we run truncation strategy.
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
