module.exports = app => {
    const category = require("../controlers/category.controller.js");
    const router = require ( "express" ).Router();

    // Retrieve all category
    router.get("/", category.findAll);

    // Create a new product
    router.post("/", category.create);

    // Updates a product with id
    router.put("/:id", category.update);

    // Delete a product with id
    router.delete("/:id", category.delete);

    app.use('/api/category', router);
};
