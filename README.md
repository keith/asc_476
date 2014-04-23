[![Build Status](https://travis-ci.org/Keithbsmiley/asc_476.png?branch=master)](https://travis-ci.org/Keithbsmiley/asc_476)
[![Code Climate](https://codeclimate.com/github/Keithbsmiley/asc_476.png)](https://codeclimate.com/github/Keithbsmiley/asc_476)
[![Coverage Status](https://coveralls.io/repos/Keithbsmiley/asc_476/badge.png)](https://coveralls.io/r/Keithbsmiley/asc_476)
[![Dependency Status](https://gemnasium.com/Keithbsmiley/asc_476.png)](https://gemnasium.com/Keithbsmiley/asc_476)

## To set up this project you have to do a few things:

- Install Ruby [RVM](http://rvm.io/)
- Run `bundle install`
- Setup mysql, set the mysql settings in config/database.yml
- Run `rake db:create`
- Run `rake db:migrate`
- Run `rake db:populate` (to generate a default user)

## Tests:

- Run `rake test:prepare`
- Run `bundle exec rspec spec`
