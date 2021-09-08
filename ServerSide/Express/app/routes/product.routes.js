module.exports = app => {
    const products = require("../controlers/product.controller.js");

    let router = require ( "express" ).Router();

    // Retrieve all products
    router.get("/", products.findAll);

    // Retrieve a single product with id
    router.get("/:id", products.findOne);

    // Create a new product
    router.post("/", products.create);

    // Updates a product with id
    router.put("/:id", products.update);

    // Delete a product with id
    router.delete("/:id", products.delete);

    app.use('/api/products', router);
};
