.PHONY: build up down logs migrate superuser shell

IMAGE_NAME = nxttrendz-backend

build:
	docker compose build
up:
	docker compose up -d --build
down:
	docker compose down
logs:
	docker compose logs -f backend
migrate:
	docker compose exec backend python manage.py migrate
superuser:
	docker compose exec backend python manage.py createsuperuser
shell:
	docker compose exec backend bash

.PHONY: build up down logs migrate superuser shell push
 
DOCKER_ID = sravanijyothirmai
BACKEND = nxttrendz-backend
FRONTEND = nxttrendz-frontend
VERSION = v1
LATEST = latest
 
push:
	docker tag $(BACKEND) $(DOCKER_ID)/$(BACKEND):$(VERSION)
	docker tag $(BACKEND) $(DOCKER_ID)/$(BACKEND):$(LATEST)
	docker push $(DOCKER_ID)/$(BACKEND):$(VERSION)
	docker push $(DOCKER_ID)/$(BACKEND):$(LATEST)
	
	docker tag $(FRONTEND) $(DOCKER_ID)/$(FRONTEND):$(VERSION)
	docker tag $(FRONTEND) $(DOCKER_ID)/$(FRONTEND):$(LATEST)
	docker push $(DOCKER_ID)/$(FRONTEND):$(VERSION)
	docker push $(DOCKER_ID)/$(FRONTEND):$(LATEST)