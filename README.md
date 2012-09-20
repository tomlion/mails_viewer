#### MailsViewer ####

   MailsViewer is a mails preview Engine which provides a table view for all mails under tmp/mails. So you can easily preview the mails
   in non-production mode and no longer need to worry about accidentally sending a test email to someone else’s address.

   MailsViewer is a fork of tomlion's [original code](https://github.com/tomlion/mails_viewer) and I'm glad to be
   the maintainer; thanks go to him for getting this thing started!

#### REQUIREMENT ####

* MailsViewer should be used with Rails >= 3.1

* In your config file, You should `require "sprockets/railtie" `if you don't `require 'rails/all'`
and enable assets pipeline by adding `config.assets.enabled = true` to config file

#### Usage ####

Add the gem to your Gemfile :

```ruby
gem "mails_viewer"
```

Set ActionMailer's delivery method to :file :

```ruby
config.action_mailer.delivery_method = :file
```

put this in your routes.rb:

```ruby
mount MailsViewer::Engine => '/delivered_mails'
```

Now just load up http://localhost:3000/delivered_mails

##### Advanced #####

You can choose to send out some mails to the inbox instead of just
storing them in the file system by specifying which mails to sent:

- `: send_if`          - Send mails that satisfy some condition

```ruby
config.action_mailer.delivery_method = :file
config.action_mailer.file_settings = {
  location: 'tmp/mails',
  smtp_settings: {
    address:              "localhost",
    port:                 25,
    domain:               'localhost.localdomain',
    user_name:            nil,
    password:             nil,
    authentication:       nil,
    enable_starttls_auto: true
  },
  send_if: lambda { |mail| mail.destinations.select { |address| ["yedingding@gmail.com"].include?(address) }.any? }
}
```

Now any mails sent to yedingding@gmail.com will not only store in the
filesystem for you to browse later, but also send out to his inbox.

Credits
-------

![pragmatic.ly](https://pragmatic.ly/assets/vlogo.png)

MailsViewer is maintained by [Pragmatic.ly](https://pragmatic.ly/ "Pragmatic.ly").

Special thanks to [tomlion](https://github.com/tomlion) for starting the project.

Copyright (c) 2012 Dingding Ye, Pragmatic.ly (dingding@pragmatic.ly, https://pragmatic.ly/)
