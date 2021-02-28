# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible.
require 'rails_helper'
require 'rspec-rails'
require 'ffaker'
require 'database_cleaner'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include Helpers::ApiHelpers, type: :api
  config.include Helpers::JsonHelpers, type: :api
  config.include ActiveSupport::Testing::TimeHelpers
  config.filter_run_when_matching :focus

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

WebMock.disable_net_connect!(allow_localhost: true)
