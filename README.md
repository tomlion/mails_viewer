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

    gem "mails_viewer",

put this in your routes.rb:

    mount MailsViewer::Engine => '/delivered_mails'

Now just load upt http://localhost:3000/delivered_mails

Credits
-------

![pragmatic.ly](https://pragmatic.ly/assets/vlogo.png)

MailsViewer is maintained by [Pragmatic.ly](https://pragmatic.ly/ "Pragmatic.ly").

Special thanks to [tomlion](https://github.com/tomlion) for starting the project.

Copyright (c) 2012 Dingding Ye, Pragmatic.ly (dingding@pragmatic.ly, https://pragmatic.ly/)
