module.exports = function(sequelize, DataTypes) {
  return sequelize.define('category', {
    CategoryID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    CategoryName: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    Description: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    Image: {
      type: DataTypes.STRING(100),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'category',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "CategoryID" },
        ]
      },
    ]
  });
};
