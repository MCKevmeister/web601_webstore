module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Payment", {
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
        PaymentDate: {
            type: DataTypes.DATEONLY,
        },
        Amount: {
            type: DataTypes.DECIMAL(13, 2),
            allowNull: false
        }
    } );
};
