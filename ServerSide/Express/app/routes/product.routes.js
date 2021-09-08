module.exports = app => {
    const product = require ( "../controlers/product.controller.js" );

    const router = require ( "express" ).Router ();

    // Retrieve all products
    router.get ( "/", product.findAll );

    // Retrieve a single product with id
    router.get ( "/:id", product.findOne );

    // Create a new product
    router.post ( "/", product.create );

    // Updates a product with id
    router.put ( "/:id", product.update );

    // Delete a product with id
    router.delete ( "/:id", product.delete );

    app.use ( '/api/product', router );
};
