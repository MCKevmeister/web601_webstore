const db = require ( "../models" );
const Category = db.category;

// Get all categories
exports.findAll = (req, res) => {
    Category.findAll ()
        .then ( data => {
            res.send ( data );
        } )
        .catch ( err => {
            res.status ( 500 ).send ( {
                message: err.message || "An error occurred while retrieving categories."
            } );
        } );
};

// Add a new Category
exports.create = (req, res) => {
    // Validate request
    if (!req.body.CategoryName) {
        res.status ( 400 ).send ( {
            message: "Please fill all required fields"
        } );
        return;
    }

    // Create a Category
    const category = {
        CategoryName: req.body.CategoryName,
        Description: req.body.Description,
        Image: req.body.Image
    };

    // Save Category in the database
    Category.create ( category )
        .then ( data => {
            res.status ( 201 ).send ( data );
        } )
        .catch ( err => {
            res.status ( 500 ).send ( {
                message: err.message || "Some error occurred while creating the Category."
            } );
        } );
};

// Updates a category by its id
exports.update = (req, res) => {
    const id = req.params.id;

    Category.update ( req.body, {
        where: {id: id}
    } )
        .then ( num => {
            if (num === 1) {
                res.status ( 200 ).send ( {
                    message: "Category was updated successfully."
                } );
            } else {
                res.status ( 500 ).send ( {
                    message: `Cannot update Category with id=${id}. Maybe Category was not found or req.body is empty!`
                } );
            }
        } )
        .catch ( err => {
            console.log ( err )
            res.status ( 500 ).send ( {
                message: "Error updating Category with id=" + id
            } );
        } );
};

// Delete category by id
exports.delete = (req, res) => {
    const id = req.params.id;

    Category.destroy ( {
        where: {id: id}
    } )
        .then ( num => {
            if (num === 1) {
                res.status ( 200 ).send ( {
                    message: "Category was deleted successfully!"
                } );
            } else {
                res.send ( {
                    message: `Cannot delete Category with id=${id}. Maybe Category was not found!`
                } );
            }
        } )
        .catch ( err => {
            console.log ( err )
            res.status ( 500 ).send ( {
                message: "Could not delete Category with id=" + id
            } );
        } );
};
