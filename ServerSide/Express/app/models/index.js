const Sequelize = require("sequelize");
const dbConfig = require("../config/db.config.js");
const initModels = require("./init-models").initModels;

const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: false,

    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    }
});

const models = initModels(sequelize);

const db = {};


db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.category = models.category;
db.customer = models.customer;
db.employee = models.employee;
db.order = models.order;
db.order_product = models.order_product;
db.payment = models.payment;
db.person = models.person;
db.product = models.product;

module.exports = db;
