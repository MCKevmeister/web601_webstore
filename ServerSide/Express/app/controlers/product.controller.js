const db = require("../models");
const Product = db.product;
const Op = db.Sequelize.Op;

/**
 * Gets all Products
 * @CategoryName {string} Filters results to Products matching param CategoryName
 * @ProductName {string} Filters products returned to those with param in ProductName
 */
exports.findAll = (req, res) => {
    let categoryName = req.query.CategoryName;
    let productName = req.query.ProductName;
    let conditionCategoryName = categoryName ? {CategoryName: {[Op.like]: `%${categoryName}%`}} : null;
    let conditionProductName = productName ? {ProductName: {[Op.like]: `%${productName}%`}} : null;

    Product.findAll({ where: conditionCategoryName, conditionProductName })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving products."
            });
        });
};

// Find a single Product with an id
exports.findOne = (req, res) => {
    const id = req.params.id;

    Product.findByPk(id)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Error retrieving Product with id=" + id
            });
        });
};

// Add a new Product
exports.create = (req, res) => {
    // Validate request
    if (!req.body.CategoryID || !req.body.LastModifiedBy || !req.body.ProductName || !req.body.IsAvailable) {
        res.status(400).send({
            message: "Please fill all required fields"
        });
        return;
    }

    // Create a Product
    const product = {
        CategoryID: req.body.CategoryID,
        LastModifiedBy: req.body.LastModifiedBy,
        ProductName: req.body.ProductName,
        Manufacturer: req.body.Manufacturer,
        Description: req.body.Description,
        QtyInStock: req.body.QtyInStock,
        Price: req.body.Price,
        MSRP: req.body.MSRP,
        Image: req.body.Image,
        LastModifiedDate: req.body.LastModifiedDate,
        IsAvailable: req.body.IsAvailable,
    };

    // Save Product in the database
    Product.create(product)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Product."
            });
        });
};

// Updates a product by its id
exports.update = (req, res) => {
    const id = req.params.id;

    Product.update(req.body, {
        where: { id: id }
    })
        .then(num => {
            if (num === 1) {
                res.status(200).send({
                    message: "Product was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update Product with id=${id}. Maybe Product was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Error updating Product with id=" + id
            });
        });
};

// Delete product by id
exports.delete = (req, res) => {
    const id = req.params.id;

    Product.destroy({
        where: { id: id }
    })
        .then(num => {
            if (num === 1) {
                res.status(200).send({
                    message: "Product was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete Product with id=${id}. Maybe Product was not found!`
                });
            }
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Could not delete Product with id=" + id
            });
        });
};

// Delete all Products from the database.
exports.deleteAll = (req, res) => {
    Product.destroy({
        where: {},
        truncate: false
    })
        .then(nums => {
            res.status(200).send({ message: `${nums} Products were deleted successfully!` });
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: err.message || "Some error occurred while removing all Products."
            });
        });
};
