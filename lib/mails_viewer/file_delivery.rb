Mail::FileDelivery.class_eval do
  # We need to save the mail to separate files when have several destination addresses
  # So we generate different file name and save them.
  def deliver!(mail)
    if ::File.respond_to?(:makedirs)
      ::File.makedirs settings[:location]
    else
      ::FileUtils.mkdir_p settings[:location]
    end

    mail.destinations.uniq.each do |to|
      ::File.open(::File.join(settings[:location], mail.filename_for(to)), 'w') { |f| "#{f.write(mail.encoded)}\r\n\r\n" }
    end

    if conditionally_sent(mail)
      send(mail)
    end
  end

  def conditionally_sent(mail)
    if settings[:send_if] && settings[:smtp_settings]
      settings[:send_if].call(mail)
    end
  rescue Exception => ex
    false
  end

  def send(mail)
    mail.delivery_method(:smtp, settings[:smtp_settings])
    mail.deliver
  end
end
