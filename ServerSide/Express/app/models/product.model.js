module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "product", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryID: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        LastModifiedBy: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        Name: {
            type: DataTypes.STRING
        },
        Manufacturer: {
            type: DataTypes.STRING
        },
        Description: {
            type: DataTypes.STRING
        },
        QtyInStock: {
            type: DataTypes.INTEGER
        },
        Price: {
            type: DataTypes.DECIMAL ( 13, 2 )
        },
        MSRP: {
            type: DataTypes.STRING
        },
        Image: {
            type: DataTypes.STRING ( 100 )
        },
        LastModifiedDate: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        IsAvailable: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    } );
};
