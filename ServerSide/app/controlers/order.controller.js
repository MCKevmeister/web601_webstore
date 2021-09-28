const db = require ( "../models" );
const Order = db.order;

/**
 * Gets all Orders
 */
exports.findAll = (req, res) => {

    Order.findAll ()
        .then ( data => {
            res.status ( 200 ).send ( data );
        } )
        .catch ( err => {
            res.status ( 500 ).send ( {
                message: err.message || "An error occurred while retrieving orders."
            } );
        } );
};

/**
 * Find a single Order with an id
 * @id {string} The id of the Order to find
 */
exports.findOne = (req, res) => {
    const id = req.params.id;

    Order.findByPk ( id )
        .then ( data => {
            res.send ( data );
        } )
        .catch ( err => {
            console.log ( err )
            res.status ( 500 ).send ( {
                message: "Error retrieving Order with id=" + id
            } );
        } );
};

/**
 * Create a new Order
 */
exports.create = (req, res) => {
    // Validate request
    if (!req.body.CustomerID || !req.body.IsDeleted) {
        res.status ( 400 ).send ( {
            message: "Please fill all required fields"
        } );
        return;
    }

    // Create a Order
    const order = {
        CustomerID: req.body.CustomerID,
        PaymentID: req.body.PaymentID,
        Status: req.body.Status,
        OrderDate: req.body.OrderDate,
        ShippedDate: req.body.ShippedDate,
        Comments: req.body.Comments,
        TrackingNumber: req.body.TrackingNumber,
        IsDeleted: req.body.IsDeleted
    };

    // Save Order in the database
    Order.create ( order )
        .then ( data => {
            res.status ( 201 ).send ( data );
        } )
        .catch ( err => {
            res.status ( 500 ).send ( {
                message: err.message || "An error occurred while creating the Order."
            } );
        } );
};

/**
 * Updates a order by its id
 * @id {string} The id of the Order to find
 */
exports.update = (req, res) => {
    const id = req.params.id;

    Order.update ( req.body, {
        where: {id: id}
    } )
        .then ( num => {
            if (num === 1) {
                res.status ( 200 ).send ( {
                    message: "Order was updated successfully."
                } );
            } else {
                res.send ( {
                    message: `Cannot update Order with id=${id}. Maybe Order was not found or req.body is empty!`
                } );
            }
        } )
        .catch ( err => {
            console.log ( err )
            res.status ( 500 ).send ( {
                message: "Error updating Order with id=" + id
            } );
        } );
};

/**
 * Delete order by id
 * @id {string} The id of the Order to delete
 */
exports.delete = (req, res) => {
    const id = req.params.id;

    Order.destroy ( {
        where: {id: id}
    } )
        .then ( num => {
            if (num === 1) {
                res.status ( 200 ).send ( {
                    message: "Order was deleted successfully!"
                } );
            } else {
                res.send ( {
                    message: `Cannot delete Order with id=${id}. Maybe Order was not found!`
                } );
            }
        } )
        .catch ( err => {
            console.log ( err )
            res.status ( 500 ).send ( {
                message: "Could not delete Order with id=" + id
            } );
        } );
};
