#!/usr/bin/env bash

PROJECT_NAME="larave-livewire"

docker-compose -f docker-compose.local.yaml \
    -p $PROJECT_NAME \
    down -v

docker system prune -f
