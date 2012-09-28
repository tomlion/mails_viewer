require 'spec_helper'

describe Mail::Message do
  context "#filename_for" do
    it "should generate a filename in format: <timestamp>.<email>.txt" do
      message = Mail::Message.new
      filename = message.filename_for("email@email.com")
      filename.should_not be_nil
      filename.should match(/\d+\.email@email\.com\.txt/)
    end
  end
end
