module.exports = app => {
    const user = require ( "../controlers/user.controller.js" );
    const router = require ( "express" ).Router ();

    // Retrieve all users
    router.get ( "/", user.findAll );

    // Retrieve a single user by id
    router.get ( "/:id", user.findOne );

    // Create a new user
    router.post ( "/", user.create );

    // Updates a user with id
    router.put ( "/:id", user.update );

    // Delete a user with id
    router.delete ( "/:id", user.delete );

    app.use ( '/api/user', router );
};
