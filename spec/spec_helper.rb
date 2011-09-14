# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
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

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  require 'rspec/expectations'

  config.include RSpec::Matchers
  config.include MailsViewer::Engine.routes.url_helpers


  config.before(:each) do
  end
end
