module.exports = function (sequelize, DataTypes) {
    return sequelize.define ( 'employee', {
        EmployeeID: {
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
        },
        Role: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        }
    }, {
        sequelize,
        tableName: 'employee',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "EmployeeID"},
                ]
            },
            {
                name: "FKEmployee879888",
                using: "BTREE",
                fields: [
                    {name: "PersonID"},
                ]
            },
        ]
    } );
};
