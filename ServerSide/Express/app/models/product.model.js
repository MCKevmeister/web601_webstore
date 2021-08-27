module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "product", {
        ProductID: {
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryID: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        LastModifiedBy: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        Name: {
            type: Sequelize.STRING
        },
        Manufacturer: {
            type: Sequelize.STRING
        },
        Description: {
            type: Sequelize.STRING
        },
        QtyInStock: {
            type: Sequelize.INTEGER
        },
        Price: {
            type: Sequelize.DECIMAL ( 13, 2 )
        },
        MSRP: {
            type: Sequelize.STRING
        },
        Image: {
            type: Sequelize.STRING ( 100 )
        },
        LastModifiedDate: {
            type: Sequelize.DATEONLY,
            allowNull: false
        },
        IsAvailable: {
            type: Sequelize.BOOLEAN,
            allowNull: false
        }
    } );
};
