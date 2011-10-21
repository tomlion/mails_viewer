module MailsViewer
  module HomeHelper
    def email_path(filename, format = :raw)
      query = {
        :filename => filename
      }.to_query

      (format.to_s + '?' + query).html_safe
    end
  end
end
