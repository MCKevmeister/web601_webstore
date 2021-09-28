module.exports = function (sequelize, DataTypes) {
    return sequelize.define ( 'customer', {
        CustomerID: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        PersonID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'person',
                key: 'PersonID'
            }
        }
    }, {
        sequelize,
        tableName: 'customer',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "CustomerID"},
                ]
            },
            {
                name: "FKCustomer415114",
                using: "BTREE",
                fields: [
                    {name: "PersonID"},
                ]
            },
        ]
    } );
};
