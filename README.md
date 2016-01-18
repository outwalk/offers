# Offers [![Build Status](https://travis-ci.org/outwalk/offers.svg?branch=master)](https://travis-ci.org/outwalk/offers)

Advertisements for the sale and lease of real estate [http://offers.kiev.ua](http://offers.kiev.ua). Make the real estate market better.

[Errbit (error catcher)](https://blooming-harbor-4061.herokuapp.com)

## Ruby version

Production server ruby version is `2.0.0`.
Please run project on the same version of ruby.

## System dependencies

Mysql of version `5.6` or higher (with support of fulltext indexes for InnoDB engine).
In the case of the lower version MySQL, you can [use engine MyISAM](http://stackoverflow.com/questions/3923891/ruby-on-rails-migration-change-table-to-myisam).

## Installation

```shell
git clone https://github.com/outwalk/offers.git
cd offers
bundle install
```

## Development

Database creation

```shell
rake db:create
rake db:migrate
```

Database initialization

```shell
rake db:seed
```

Check created users emails in [db/seeds/users.rb](/db/seeds/users.rb)

Run local server on http:://localhost:3000

```shell
rails s
```

## Testing

Craete database for test environment

```shell
rake db:test:prepare
```

Run the test suite

```shell
rspec spec
```

## Deployment instructions

Check authentication agent keys and add key `~/.ssh/id_rsa`

```shell
ssh-add -l
eval `ssh-agent` 1> /dev/null; ssh-add ~/.ssh/id_rsa 2> /dev/null
```

Deploy specific branch to staging

```shell
BRANCH=feature/new_feature_name cap staging deploy
```

Deploy master branch to production

```shell
cap production deploy
```

## Production Server

SSH connect

```shell
ssh deploy@alav.chost.com.ua
```

Rails console

```shell
cd /var/www/alav/data/www/staging.offers.kiev.ua/current && RAILS_ENV=staging bundle exec rails c
cd /var/www/alav/data/www/offers.kiev.ua/current && RAILS_ENV=production bundle exec rails c
```

Database access

```shell
cd /var/www/alav/data/www/staging.offers.kiev.ua/current && RAILS_ENV=staging bundle exec rails db -p
cd /var/www/alav/data/www/offers.kiev.ua/current && RAILS_ENV=production bundle exec rails db -p
```

Configure Apache Server

```shell
vim /etc/httpd/conf/httpd.conf
```

Restart Apache Server

```shell
sudo apachectl restart
```

Trace Logs

```shell
tail -f /var/log/httpd/error_log
tail -f /var/www/httpd-logs/offers.kiev.ua.error.log
tail -f /var/www/alav/data/www/offers.kiev.ua/current/log/production.log
```
