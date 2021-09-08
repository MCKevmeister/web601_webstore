# API's

## Products API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/product | Gets all products |
| GET | api/product?ProductName=keyword | Gets all products where ProductName contains "keyword" |
| GET | api/product?CategoryName=keyword | Gets all products where CategoryName contains "keyword" |
| GET | api/product/:id | Gets product by id |
| POST | api/product | Add a new product |
| PUT | api/product/:id | Update a product by id |
| DELETE | api/product/:id | Delete product by id |

## Category API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET  | api/category | Gets all categories |
| POST | api/category | Add a new category |
| PUT | api/category/:id | Update a category by id |
| DELETE | api/category/:id | Delete category by id |

## User API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/user | Get all users |
| GET | api/user/:id | Get user by id |
| POST | api/user?AccountType=keyword&Role=keyword | Add a new user and assigns them a customer/employee based on AccountType "keyword". Role is passed if the user account type is an employee. |
| PUT | api/user/:id | Update a user by id |
| DELETE | api/user | Delete user by id |

## Orders API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/orders | Gets all orders |
| GET | api/orders/:id | Gets product by id |
| POST | api/orders | Add a new orders |
| PUT | api/orders/:id | Updates a orders by its id |
| DELETE | api/order | Delete an order by id |
