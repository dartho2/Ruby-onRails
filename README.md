<<<<<<< HEAD
# README

config/datebase.yml
=======
**ROR**
```
login: admin@admin.com 
password: admin123
```
first edit:
```
config/datebase.yml
```

past sql or use default databese :
```
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: d8barp8ovc1ef8
  username: uubydzwbrutlja
  password: 604ede45450d16b9260d443911db8af8fcd4e25e2374c110a1f89dbfe18fb2e4
  port: 5432
  uri: postgres://uubydzwbrutlja:604ede45450d16b9260d443911db8af8fcd4e25e2374c110a1f89dbfe18fb2e4@ec2-54-247-177-33.eu-west-1.compute.amazonaws.com:5432/d8barp8ovc1ef8
```

then:
```
bundle update
```

```
rails s
```
```
rails db:seed  or rake db:seed
```
if problem with bcrypt 3.1.11:
```
gem uninstall bcrypt-ruby
gem uninstall bcrypt
gem install bcrypt --platform=ruby
```

