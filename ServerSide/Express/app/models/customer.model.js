module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Customer", {
        ID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        PersonID: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: Person,
                key: 'ID',
            }
        }
    } );
};
