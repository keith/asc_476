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
- Run `rake db:seed`

### Or

- Run `./bootstrap.sh`

### Server

When you're ready to run the application:

- Run `rails server`
- Visit `localhost:3000`

## Tests:

- Run `rake test:prepare`
- Run `bundle exec rspec spec`


#### Fake Courses

- Run `rake db:courses`
