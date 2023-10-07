# SprintSuite - Demo Project

We want to build a feature that lets you view all tweets and Facebook posts from lists of people.

## Getting Started

### Dependencies

- Docker
- Docker Compose

### Running application

```
docker compose build
docker compose run --rm -e RAILS_ENV=development web bundle exec rails db:seed
docker compose up -d
```

If you want to rebuild your local development:

```
docker compose down
docker compose build --no-cache
docker compose run --rm -e RAILS_ENV=test web bundle exec rails db:drop db:create
docker compose run --rm -e RAILS_ENV=development web bundle exec rails db:drop db:setup
docker compose up -d
```

## Testing

```
docker compose run --rm -e RAILS_ENV=test web bundle exec rails db:create
docker compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

## Version History

- 1.0
  - Initial Release
