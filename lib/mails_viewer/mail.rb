module Mail
  class Message
    # Save the mail to separate files when have several destination addresses
    # This function used to return a filename by mail's date and destination address
    def filename_for(to)
      timestamp = (date && date.to_time) || Time.now
      "#{timestamp.to_i}.#{to}.txt"
    end
  end
end
