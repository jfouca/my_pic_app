.PHONY: install test

install: build up

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

test:
	docker-compose run web bundle exec rspec