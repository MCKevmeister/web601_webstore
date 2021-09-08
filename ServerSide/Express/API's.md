# API's

## Products API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/product | Gets all products |
| GET | api/product/:id | Gets product by id |
| GET | api/product?ProductName=keyword | Gets all products where ProductName contains "keyword" |
| GET | api/product?CategoryName=keyword | Gets all products where CategoryName contains "keyword" |
| POST | api/product | Add a new product |
| PUT | api/product/:id | Updates a product by its id |
| DELETE | api/product/:id | Delete product by id |

## Category API

| Methods | URL | Actions |
| ------- | :--- | ------: |
| GET | api/category | Gets all categories |
| GET | api/category/:id | Gets all details about a single category |
| POST | api/category | Add a new category |
| PUT | api/category/:id | Updates a category by its id |
| DELETE | api/category | Remove category by id |
|  |  |  |

## User API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/user | Gets all users |
| GET | api/user/:id | Gets user by id |
| POST | api/user | Add a new user |
| PUT | api/user/:id | Updates a user by its id |
| DELETE | api/user | Remove user by id |

## Orders API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/orders | Gets all orders |
| GET | api/orders/:id | Gets product by id |
| POST | api/orders | Add a new orders |
| PUT | api/orders/:id | Updates a orders by its id |
| DELETE | api/order | Remove an orders by id |
