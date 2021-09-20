module.exports = function (sequelize, DataTypes) {
    return sequelize.define ( 'person', {
        PersonID: {
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        FirstName: {
            type: DataTypes.STRING ( 255 ),
            allowNull: false
        },
        LastName: {
            type: DataTypes.STRING ( 255 ),
            allowNull: false
        },
        Email: {
            type: DataTypes.STRING ( 255 ),
            allowNull: false,
            unique: "Email"
        },
        Password: {
            type: DataTypes.BLOB,
            allowNull: false
        },
        Phone: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        },
        Address: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        },
        City: {
            type: DataTypes.STRING ( 255 ),
            allowNull: true
        },
        PostCode: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        IsDeleted: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    }, {
        sequelize,
        tableName: 'person',
        timestamps: false,
        indexes: [
            {
                name: "PRIMARY",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "PersonID"},
                ]
            },
            {
                name: "Email",
                unique: true,
                using: "BTREE",
                fields: [
                    {name: "Email"},
                ]
            },
        ]
    } );
};
