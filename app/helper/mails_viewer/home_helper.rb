module MailsViewer
  module HomeHelper
    def email_path(filename, format = :raw)
      url_for(controller: "mails_viewer/home", action: format, filename: filename)
    end

    def attachment_path(filename, attachment_name)
      url_for(controller: "mails_viewer/home", action: :attachment, filename: filename, attachment: attachment_name)
    end
  end
end
