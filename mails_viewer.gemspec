$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mails_viewer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mails_viewer"
  s.version     = MailsViewer::VERSION
  s.authors     = ["Youcai Qian", "Dingding Ye"]
  s.email       = ["qycpublic@gmail.com", "yedingding@gmail.com"]
  s.homepage    = "https://github.com/pragmaticly/mails_viewer"
  s.summary     = "A mails preview Engine which provides a table view for all mails under tmp/mails."
  s.description = "A mails preview Engine which provides a table view for all mails under tmp/mails."

  s.files = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Gemfile", "Rakefile",  "README.md"] - ["Gemfile.lock"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_development_dependency "mail", '~> 2.4.0'
  s.add_development_dependency 'rspec', '~> 2.11.0'
end
