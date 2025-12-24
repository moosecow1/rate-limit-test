# API Rate Limiter

> REST API with a custom rate limiter

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Instructions

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. Open Docker Desktop
3. Run `docker-compose up`

# Rate Limit
If a client sends too many requests in too short of a time span, new requests will be blocked.

It will tell you how long until you can request again.
```json
{
  "try_in": 5
}
```

# Configuration
The limits can be configured in `docker-compose..yaml` under api/environment. 

The variables that matter are:
- RATE_LIMIT, this is how many requests the limiter will accept in the time period
- RATE_PERIOD, this is how long it takes until a previous request is forgotten

# API
`GET /get-quote` returns a random quote:
```json
{
  "text": "Example quote.",
  "author": "Example Name"
}
```
`GET /get-quote?Demo Name` returns only quotes by a specific author:
```json
{
  "text": "Example quote.",
  "author": "Demo Name"
}
```
