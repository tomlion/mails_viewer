module FileHelpers

  def delete_all_mails
    FileUtils.rm_r(::File.expand_path('../dummy/tmp/mails/', __FILE__))
  rescue
    true
  end

  def has_file?(file)
    File.exist?(file) || File.exist?(File.expand_path('../dummy/tmp/mails/'+file, __FILE__))
  end

  def has_mail_files?(mail)
    mail.destinations.uniq.each do |to|
      return false unless has_file?(mail.filename_for(to))
    end
    return true
  end

end
