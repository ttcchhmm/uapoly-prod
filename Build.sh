#!/usr/bin/env bash

rm -rf ./frontend ./backend

echo 'Cloning repositories...'
git clone 'git@github.com:Gyrehio/uapoly-frontend.git' frontend
git clone 'git@github.com:ttcchhmm/uapoly-backend.git' backend

echo 'Building frontend...'
cd frontend
npm i
npm run build
find ./build -type f | parallel gzip -6 --keep
find ./build -type f -not -name '*.gz' | parallel brotli -6 --keep
cd ..

echo 'Building backend...'
cd backend
npm i
npm run build-prod
cd ..

echo 'Building Docker images...'
docker-compose build --no-cache