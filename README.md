# README

- 立ち上げ手順
```
touch Dockerfile Gemfile Gemfile.lock entrypoint.sh docker-compose.yml 

docker-compose run api rails new . --force --no-deps --skip-test --database=mysql -B --api

dc build

docker-compose run --rm api rails db:create 
```
