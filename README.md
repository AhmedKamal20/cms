# CMS

## Description

JSON API for a CMS, it has Users, and every user have articles.

## Usege

```
GET    /users
POST   /users
GET    /users/:id
PATCH  /users/:id
DELETE /users/:id

GET    /articles
POST   /articles
GET    /articles/:id
PATCH  /articles/:id
DELETE /articles/:id
```

## Dependencies

* Ruby 2.6.3
* Rails 5.2.3
* Postgres 9.4
* NodeJs

## To Install

* `bundle install`
* `rails db:create db:migrate`
* `rails server -b 0.0.0.0 -p 3000`

P.S. You can user Docker; The Docker file and Docker Compose provided.

## To run Tests

* `bundle exec rspec`
