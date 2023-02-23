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

**Running BE API(with docker)** 
```
- cd blog
- touch .env
- docker-compose build
- docker-compose up
```
**Running BE API(without docker)** 
```
- cd blog
- rails db:create db:migrate
- rails s
```

- API URL: http://localhost:3000

**Running RSpec(with docker)** 
```
- cd blog
- docker exec -it blog-api bash
- RAILS_ENV=test rspec spec
```
**Running RSpec(without docker)** 
```
- cd blog
- RAILS_ENV=test rspec spec
```

**Generate API Documentation(with docker)** 
```
- cd blog
- docker exec -it blog-api bash
- rake docs:generate
```
**Generate API Documentation(without docker)** 
```
- cd blog
- rake docs:generate
```
- API Documentation URL: http://localhost:3000/api/docs

**Running Frontend(with docker)** 
```
- cd blog/app/frontend
- touch .env
- docker-compose build
- docker-compose up
```
**Running Frontend(without docker)** 
```
- cd blog/app/frontend
- npm install
- npm start
```

Frontend App URL: http://localhost:4000

**API playground(REST Client)** 
- Install VS Code [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extention (if you are using VS Code)
- Run [Articles](doc/rest_client/articles.http)
- Run [Likes](doc/rest_client/likes.http)
