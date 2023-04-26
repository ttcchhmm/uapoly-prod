# Scripts and configuration files for building UApoly in production
This repository contains scripts and configuration files for building UApoly in production.

## Requirements
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Git](https://git-scm.com/)
- [OpenSSL](https://www.openssl.org/)
- [`gzip`](https://www.gnu.org/software/gzip/)
- [`brotli`](https://github.com/google/brotli)
- [NPM](https://www.npmjs.com/)
- [Node.js](https://nodejs.org/en/)


## Generating secrets
You can use the `GenerateSecrets.sh` script to generate the secrets needed for the production environment. The script will generate a `.env` file with the following secrets:
- `JWT_SECRET`
- `DB_PASSWORD`
- `DB_USER`

You will need to fill the rest of the `.env` file by hand. See the [`.env.example`](https://github.com/ttcchhmm/uapoly-backend/blob/master/.env.example) file from the backend for an example.

## Building the production environment
You can use the `Build.sh` script to build the production environment. The script will build the following images:
- `uapoly-nginx`
- `uapoly-prod`

Before running the build script, make sure that you :
- Generated the secrets
- Filled the `.env` file
- Are connected to the Internet (avoid metered connections, a lot of data will be downloaded)

## Running the production environment
You can start the production environment using Docker Compose :
```bash
docker-compose up -d
```

Make sure to run the migrations after an update or before the first run.

## Stopping the production environment
You can stop the production environment using Docker Compose :
```bash
docker-compose down
```