#!/bin/sh
DOCKER_PROJECT_NAME="upsource:2.5"
DOCKER_REPO="docker-stage.ipsoft.com"

docker build --tag="$DOCKER_REPO/$DOCKER_PROJECT_NAME" .

if test "$1" = "--push"
then
	docker push "$DOCKER_REPO/$DOCKER_PROJECT_NAME"
fi
