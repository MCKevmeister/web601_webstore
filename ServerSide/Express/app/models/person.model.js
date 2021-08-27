module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Person", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CustomerID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: Customer,
                key: 'ID'
            }
        },
        PaymentID: {
            type: DataTypes.STRING,
            references: {
                model: Payment,
                key: 'ID'
            }
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
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    } );
};
