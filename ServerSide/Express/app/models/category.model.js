module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Category", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryName: {
            type: DataTypes.STRING,
            allowNull: false
        },
        Description: {
            type: DataTypes.STRING,
        },
        Image: {
            type: DataTypes.STRING(100),
            allowNull: false
        }
    } );
};
