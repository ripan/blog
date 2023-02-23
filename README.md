**Environment**
|  |  |
|--|--|
| Rails version | 7.0.4.2  |
| Ruby version | 2.7.6  |
| Docker version | 20.10.21  |
| Docker Compose version | 2.13.0  |
| Database | sqlite3  |
| Testing Framework | RSpec  |

**Clone The Repository**
```
git clone https://github.com/ripan/blog.git
```

**Running BE API** 
```
- cd blog
- touch .env
- docker-compose build
- docker-compose up
```
- API URL: http://localhost:3000

- API Documentation URL: http://localhost:3000/api/docs

**Running RSpec** 
```
- cd blog
- docker exec -it blog-api bash
- RAILS_ENV=test rspec spec
```
**Regenerate API Documentation** 
```
- cd blog
- docker exec -it blog-api bash
- rake docs:generate
```

**Running Frontend** 
```
- cd blog/app/frontend
- touch .env
- docker-compose build
- docker-compose up
```
Frontend App URL: http://localhost:4000
