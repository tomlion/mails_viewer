### MailsViewer

   It provides a table view for all mails under /tmp/mails.
   You can sort mails by Date, From/To Address or Subject, you can also preview emails on the same page.

### Usage

* gem install mails_viewer

* put this in your routes.rb:
    `mount MailsViewer::Engine => '/mails_controller_path_that_you_like'`

* then visit http://server/mails_controller_path_that_you_like 

This project rocks and uses MIT-LICENSE.
