### MailsViewer

   It provides a table view for all mails under /tmp/mails.
   You can sort mails by Date, From/To Address or Subject, you can also preview emails on the same page.

### REQUIREMENT

* MailsViewer should be used with Rails 3.1

* In your config file, You should `require "sprockets/railtie" `if you don't `require 'rails/all'`
and enable assets pipeline by adding `config.assets.enabled = true` to config file

### Usage

* include mails_viewer in your Gemfile

* put this in your routes.rb:
    `mount MailsViewer::Engine => '/mails_controller_path_that_you_like'`

* then visit http://server/mails_controller_path_that_you_like 

This project rocks and uses MIT-LICENSE.
