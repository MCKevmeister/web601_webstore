module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "product", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CustomerID: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        PaymentID: {
            type: DataTypes.STRING,
        },
        Status: {
            type: DataTypes.STRING,
            allowNull: false
        },
        OrderDate: {
            type: DataTypes.DATEONLY
        },
        ShippedDate: {
            type: DataTypes.DATEONLY
        },
        Comments: {
            type: DataTypes.STRING
        },
        TrackingNumber: {
            type: DataTypes.STRING
        },
        IsDeleted: {
            type: DataTypes.BOOLEAN
            allowNull: false
        }
    } );
};
