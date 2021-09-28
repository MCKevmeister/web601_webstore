module.exports = function (sequelize, DataTypes) {
    return sequelize.define ( 'order_product', {
        OrderID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            references: {
                model: 'order',
                key: 'OrderID'
            }
        },
        ProductID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            references: {
                model: 'product',
                key: 'ProductID'
            }
        },
        Qty: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        PriceEach: {
            type: DataTypes.DECIMAL ( 13, 2 ),
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'order_product',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "OrderID"},
                    {name: "ProductID"},
                ]
            },
            {
                name: "FKOrder_Prod535307",
                using: "BTREE",
                fields: [
                    {name: "ProductID"},
                ]
            },
        ]
    } );
};
