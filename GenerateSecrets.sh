#!/usr/bin/env bash
echo 'You are about to generate new secrets. This will overwrite .env file. Are you sure? (y/N)'
read -r answer
if [[ $answer == 'y' ]]; then
    rm .env
    echo "JWT_SECRET=$(openssl rand -base64 512 | tr -d '\n')" >> .env
    echo "DB_PASSWORD=$(openssl rand -base64 512 | tr -d '\n')" >> .env
    echo "DB_USER=$(openssl rand -base64 128 | sha512sum -z | cut -d ' ' -f 1 | cut -c 1-20 | tr -d '\n')" >> .env

    echo 'Done. Make a backup of the new .env file.'
fi
