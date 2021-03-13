# 	Можно указать перед реальной командой @ для того, чтобы она не показывалась при вызове

# 	Можно указать пере алиасом другой алиас, который будет выполняться первым, например
# docker-build: perm
#	docker-compose up --build -d

# 	Можно запускать оригинальные команды не напрямую через docker:
# php-cli:
# 	docker exec app_php-cli_1
# ... а через docker-compose

docker-up:
	docker-compose up -d

docker-build:
	docker-compose up --build -d

docker-down:
	docker-compose down

docker-ps:
	docker-compose ps

test:
	docker-compose exec php-cli vendor/bin/phpunit

assets-install:
	docker-compose exec node yarn install

assets-dev:
	docker-compose exec node yarn run dev

assets-watch:
	docker-compose exec node yarn run watch

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
