require 'mails_viewer'
require 'rails'

module MailsViewer
  class Engine < Rails::Engine
    engine_name = :mails_viewer
    isolate_namespace MailsViewer

    # Enabling assets precompiling under rails 3.1
    if Rails.version >= '3.1'
      initializer :assets do |app|
        app.config.assets.precompile += %w(mails_viewer.js mails_viewer.css)
      end
    end
  end
end
