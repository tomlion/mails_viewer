require 'mails_viewer'
require 'rails'

module MailsViewer
  class Engine < Rails::Engine
    engine_name = :mails_viewer
    isolate_namespace MailsViewer
  end
end
