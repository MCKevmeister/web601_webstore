# API's

## Products API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET | api/product | Gets all products |
| GET | api/product?ProductName=keyword | Get all products where ProductName contains "keyword" |
| GET | api/product?CategoryName=keyword | Get all products where CategoryName contains "keyword" |
| GET | api/product/:id | Get product by id |
| POST | api/product | Add a new product |
| PUT | api/product/:id | Update a product by id |
| DELETE | api/product/:id | Delete product by id |

## Category API

| Methods | URL | Actions |
| ------- | ---- | ------- |
| GET  | api/category | Get all categories |
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
| GET | api/order | Get all orders |
| GET | api/order/:id | Get order by id |
| POST | api/order | Add a new order |
| PUT | api/order/:id | Updates a order by its id |
| DELETE | api/order/:id | Delete an order by id |
