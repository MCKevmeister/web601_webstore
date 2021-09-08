const db = require("../models");
const Person = db.person;
const Customer = db.customer;

// Gets all Customers

exports.findAll = (req, res) => {
    Customer.findAll()
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving user."
            });
        });
};

// Find a single Customer with an id
exports.findOne = (req, res) => {
    const id = req.params.id;

    Customer.findByPk(id)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Error retrieving Customer with id=" + id
            });
        });
};

// Add a new Customer
exports.create = (req, res) => {
    // Validate request
    if (!req.body.CategoryID || !req.body.LastModifiedBy || !req.body.CustomerName || !req.body.IsAvailable) {
        res.status(400).send({
            message: "Please fill all required fields"
        });
        return;
    }

    // Create Person
    const person = {
        FirstName: req.body.FirstName,
        LastName: req.body.LastName,
        Email: req.body.Email,
        Phone: req.body.Phone,
        Address: req.body.Address,
        City: req.body.City,
        PostCode: req.body.PostCode,
    };

    // Save Person in the database
    Person.create(person)
        .then(personData => {

            // Create Customer
            const customer = {
                PersonID: personData.PersonID
            };

            Customer.create(customer)
                .then(customerData => {
                    res.status(201).send(customerData);
                })
                .catch(err => {
                    res.status(500).send({
                        message: err.message || "An error occurred while creating the Customer."
                    });
                });
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "An error occurred while creating the Customer."
            });
        });
};

// Updates a Customer by id
exports.update = (req, res) => {
    const id = req.params.id;

    Customer.update(req.body, {
        where: { id: id }
    })
        .then(num => {
            if (num === 1) {
                res.status(200).send({
                    message: "Customer was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update Customer with id=${id}. Maybe the Customer was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Error updating Customer with id=" + id
            });
        });
};

// Delete Customer by id
exports.delete = (req, res) => {
    const id = req.params.id;

    Customer.destroy({
        where: { id: id }
    })
        .then(num => {
            if (num === 1) {
                res.status(200).send({
                    message: "Customer was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete Customer with id=${id}. Maybe Customer was not found!`
                });
            }
        })
        .catch(err => {
            console.log (err)
            res.status(500).send({
                message: "Could not delete Customer with id=" + id
            });
        });
};
