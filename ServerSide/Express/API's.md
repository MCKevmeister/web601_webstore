# API's

## Products API

| Methods | Urls | Actions |
| ------- | ---- | ------- |
| GET | api/products | Gets all products |
| GET | api/products/:id | Gets product by id |
| GET | api/products?name=[keyword] | Gets all products where name contains "keyword"
| POST | api/products | Add a new product |
| PUT | api/products/:id | Updates a product by its id |
| DELETE | api/products | Remove product by id |

## Category API

| Methods | Urls | Actions |
| ------- | ---- | ------- |
| GET | api/category | Gets all category |
| GET | api/category/:id | Gets all products in a category by id |
| GET | api/category?name=[keyword] | Gets all category where name contains "keyword"
| POST | api/category | Add a new category |
| PUT | api/category/:id | Updates a category by its id |
| DELETE | api/category | Remove category by id |

## User API

| Methods | Urls | Actions |
| ------- | ---- | ------- |
| GET | api/user | Gets all users |
| GET | api/user/:id | Gets user by id |
| POST | api/user | Add a new user |
| PUT | api/user/:id | Updates a user by its id |
| DELETE | api/user | Remove user by id |

## Orders API

| Methods | Urls | Actions |
| ------- | ---- | ------- |
| GET | api/orders | Gets all orders |
| GET | api/orders/:id | Gets product by id |
| POST | api/orders | Add a new orders |
| PUT | api/orders/:id | Updates a orders by its id |
| DELETE | api/order | Remove an orders by id |