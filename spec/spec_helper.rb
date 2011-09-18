ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment",  __FILE__)
require 'rspec/rails'
require 'database_helpers'
require 'file_helpers'

ActionMailer::Base.delivery_method = :file
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "example.com"

Rails.backtrace_cleaner.remove_silencers!

include DatabaseHelpers
drop_all_tables
migrate_database

include FileHelpers
delete_all_mails

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.include RSpec::Matchers
  config.include MailsViewer::Engine.routes.url_helpers
end

