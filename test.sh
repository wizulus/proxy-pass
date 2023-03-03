#!/bin/bash
set -e
docker build --tag proxy-pass .
docker-compose up;
