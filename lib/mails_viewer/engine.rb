require 'mails_viewer'
require 'rails'

module MailsViewer
  class Engine < Rails::Engine
    engine_name = :mails_viewer
    isolate_namespace MailsViewer

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end

end
