module.exports = app => {
    const order = require ( "../controlers/order.controller.js" );
    const router = require ( "express" ).Router ();

    // Retrieve all orders
    router.get ( "/", order.findAll );

    // Retrieve a single order by id
    router.get ( "/:id", order.findOne );

    // Create a new order
    router.post ( "/", order.create );

    // Updates a order with id
    router.put ( "/:id", order.update );

    // Delete a order with id
    router.delete ( "/:id", order.delete );

    app.use ( '/api/order', router );
}
