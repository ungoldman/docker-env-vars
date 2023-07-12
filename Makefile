up:
	docker compose up

build:
	docker compose build

alt1:
	docker compose build --build-arg NODE_ENV=peekaboo

alt2:
	docker compose run -e NODE_ENV=gotcha vartest
