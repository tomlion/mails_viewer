require 'mails_viewer'
require 'rails'

module MailsViewer
  class Engine < Rails::Engine
    isolate_namespace MailsViewer
  end
end
