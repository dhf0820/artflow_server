require 'database_cleaner'
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction #:truncation
    DatabaseCleaner.clean_with :transaction #:truncation
  end

  config.before(:each) do |example|
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end