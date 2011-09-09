$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mails_viewer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mails_viewer"
  s.version     = MailsViewer::VERSION
  s.authors     = ["Youcai Qian"]
  s.email       = ["qycpublic@gmail.com"]
  s.homepage    = "http://intridea.com"
  s.summary     = "A visual interface for mails under /tmp/mails."
  s.description = "A visual interface for mails under /tmp/mails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0.0"
  s.add_dependency "mail"
end
