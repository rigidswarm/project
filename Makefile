# Можно указать перед реальной командой @ для того, чтобы она не показывалась при вызове
# Можно указать пере алиасом другой алиас, который будет выполняться первым, например
# docker-build: perm
#	docker-compose up --build -d

docker-up:
	docker-compose up -d

docker-build:
	docker-compose up --build -d

docker-down:
	docker-compose down

docker-ps:
	docker-compose ps

test:
	docker exec app_php-cli_1 vendor/bin/phpunit --colors=always

assets-install:
	docker exec app_node_1 yarn install

assets-dev:
	docker exec app_node_1 yarn run dev

assets-watch:
	docker exec app_node_1 yarn run watch

perm:
	chown ${USER}:${USER} bootstrap/cache -R
	chown ${USER}:${USER} storage -R
	if [ -d "node_modules" ]; then chown ${USER}:${USER} node_modules -R; fi
	if [ -d "public/build" ]; then chown ${USER}:${USER} public/build -R; fi

############################################################

#composer:
#	php composer.phar

php-cli:
	docker-compose exec php-cli

dcli:
	docker exec app_php-cli_1

php-cli-composer:
	docker-compose exec php-cli php composer.phar
