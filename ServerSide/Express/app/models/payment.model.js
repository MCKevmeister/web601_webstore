module.exports = (sequelize, DataTypes) => {
    return sequelize.define ( 'payment', {
        PaymentID: {
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
        PaymentDate: {
            type: DataTypes.DATEONLY,
            allowNull: true
        },
        Amount: {
            type: DataTypes.DECIMAL ( 13, 2 ),
            allowNull: true
        }
    }, {
        sequelize,
        tableName: 'payment',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "PaymentID"},
                ]
            },
            {
                name: "FKPayment617515",
                using: "BTREE",
                fields: [
                    {name: "CustomerID"},
                ]
            },
        ]
    } );
};
