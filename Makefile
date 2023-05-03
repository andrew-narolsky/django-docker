build:
	docker compose up -d --build

up:
	docker compose up -d

ps:
	docker compose ps

down:
	docker compose down && docker network prune --force

clean:
	docker rm -f $(docker ps -qa) && docker volume rm $(docker volume ls)

test:
	docker exec -it django python manage.py test

migrate:
	docker exec -it django python manage.py makemigrations && docker exec -it django python manage.py migrate

superuser:
	docker exec -it django python manage.py createsuperuser

static:
	docker exec -it django python manage.py collectstatic

shell:
	docker exec -it django python manage.py shell