module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Order_Product", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        ProductID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: Product,
                key: 'ID'
            }
        },
        Qty: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        PriceEach: {
            type: DataTypes.DECIMAL(13, 2),
            allowNull: false
        }
    } );
};
