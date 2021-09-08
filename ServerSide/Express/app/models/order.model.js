module.exports = function (sequelize, DataTypes) {
    return sequelize.define ( 'order', {
        OrderID: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        CustomerID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'customer',
                key: 'CustomerID'
            }
        },
        PaymentID: {
            type: DataTypes.INTEGER,
            allowNull: true,
            references: {
                model: 'payment',
                key: 'PaymentID'
            }
        },
        Status: {
            type: DataTypes.STRING ( 255 ),
            allowNull: false
        },
        OrderDate: {
            type: DataTypes.DATEONLY,
            allowNull: true
        },
        ShippedDate: {
            type: DataTypes.DATEONLY,
            allowNull: true
        },
        Comments: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        },
        TrackingNumber: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        },
        IsDeleted: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'order',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "OrderID"},
                ]
            },
            {
                name: "FKOrder835009",
                using: "BTREE",
                fields: [
                    {name: "CustomerID"},
                ]
            },
            {
                name: "FKOrder355972",
                using: "BTREE",
                fields: [
                    {name: "PaymentID"},
                ]
            },
        ]
    } );
};
