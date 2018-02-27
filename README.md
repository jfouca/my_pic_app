# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

    2.5.0

* Configuration

    make install

* How to run the test suite

    make test

* Deployment instructions with Elastic beanstalk (see https://docs.aws.amazon.com/fr_fr/elasticbeanstalk/latest/dg/create_deploy_Ruby_rails.html)

    eb deploy

* Usage

    curl -X POST \
      http://localhost:3000/my_pic \
      -H 'Content-Type: application/json' \
      -d '{
        "text": "Sample text",
        "format": "png",
        "height": 600,
        "width": 800
    }'
