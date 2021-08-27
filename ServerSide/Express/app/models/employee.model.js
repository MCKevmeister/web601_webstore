module.exports = (sequelize, Sequelize) => {
    return sequelize.define ( "Employee", {
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
        },
        Role: {
            type: DataTypes.STRING
        }
    } );
};
