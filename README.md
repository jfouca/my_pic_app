# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

    2.4.1

* System dependencies

    bundle install

* Configuration

    sqlite3

* Database initialization

    rake db:create && rake db:migrate

* How to run the test suite

    bundle exec rspec

* Deployment instructions

    cap production deploy

* Usage

    curl -X POST \
      http://13.58.36.156:3000/my_pic \
      -H 'Content-Type: application/json' \
      -d '{
        "text": "Sample text",
        "format": "png",
        "height": 600,
        "width": 800
    }'
