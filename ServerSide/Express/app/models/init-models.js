const DataTypes = require ( "sequelize" ).DataTypes;
const _category = require("./category.model.js");
const _customer = require("./customer.model.js");
const _employee = require("./employee.model.js");
const _order = require("./order.model.js");
const _order_product = require("./order_product.model.js");
const _payment = require("./payment.model.js");
const _person = require("./person.model.js");
const _product = require("./product.model.js");

function initModels(sequelize) {
    const category = _category ( sequelize, DataTypes );
    const customer = _customer ( sequelize, DataTypes );
    const employee = _employee ( sequelize, DataTypes );
    const order = _order ( sequelize, DataTypes );
    const order_product = _order_product ( sequelize, DataTypes );
    const payment = _payment ( sequelize, DataTypes );
    const person = _person ( sequelize, DataTypes );
    const product = _product ( sequelize, DataTypes );

    order.belongsToMany(product, { as: 'ProductID_products', through: order_product, foreignKey: "OrderID", otherKey: "ProductID" });
    product.belongsToMany(order, { as: 'OrderID_orders', through: order_product, foreignKey: "ProductID", otherKey: "OrderID" });
    product.belongsTo(category, { as: "Category", foreignKey: "CategoryID"});
    category.hasMany(product, { as: "products", foreignKey: "CategoryID"});
    order.belongsTo(customer, { as: "Customer", foreignKey: "CustomerID"});
    customer.hasMany(order, { as: "orders", foreignKey: "CustomerID"});
    payment.belongsTo(customer, { as: "Customer", foreignKey: "CustomerID"});
    customer.hasMany(payment, { as: "payments", foreignKey: "CustomerID"});
    product.belongsTo(employee, { as: "LastModifiedBy_employee", foreignKey: "LastModifiedBy"});
    employee.hasMany(product, { as: "products", foreignKey: "LastModifiedBy"});
    order_product.belongsTo(order, { as: "Order", foreignKey: "OrderID"});
    order.hasMany(order_product, { as: "order_products", foreignKey: "OrderID"});
    order.belongsTo(payment, { as: "Payment", foreignKey: "PaymentID"});
    payment.hasMany(order, { as: "orders", foreignKey: "PaymentID"});
    customer.belongsTo(person, { as: "Person", foreignKey: "PersonID"});
    person.hasMany(customer, { as: "customers", foreignKey: "PersonID"});
    employee.belongsTo(person, { as: "Person", foreignKey: "PersonID"});
    person.hasMany(employee, { as: "employees", foreignKey: "PersonID"});
    order_product.belongsTo(product, { as: "Product", foreignKey: "ProductID"});
    product.hasMany(order_product, { as: "order_products", foreignKey: "ProductID"});

  return {
    category,
    customer,
    employee,
    order,
    order_product,
    payment,
    person,
    product,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
