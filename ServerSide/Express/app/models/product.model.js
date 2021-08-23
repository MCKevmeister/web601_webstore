module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "product", {
        CategoryID: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        LastModifiedBy: {
            type: DataTypes.INTEGER,
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
            type: Sequelize.DATEONLY
        },
        IsAvailable: {
            type: Sequelize.BOOLEAN,
            allowNull: false
        }
    } );
};
