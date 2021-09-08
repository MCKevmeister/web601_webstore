module.exports = function(sequelize, DataTypes) {
  return sequelize.define('product', {
    ProductID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    CategoryID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'category',
        key: 'CategoryID'
      }
    },
    LastModifiedBy: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'employee',
        key: 'EmployeeID'
      }
    },
    ProductName: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    Manufacturer: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    Description: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    QtyInStock: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Price: {
      type: DataTypes.DECIMAL(13,2),
      allowNull: true
    },
    MSRP: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    Image: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    LastModifiedDate: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    IsAvailable: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'product',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ProductID" },
        ]
      },
      {
        name: "FKProduct837757",
        using: "BTREE",
        fields: [
          { name: "CategoryID" },
        ]
      },
      {
        name: "FKProduct47824",
        using: "BTREE",
        fields: [
          { name: "LastModifiedBy" },
        ]
      },
    ]
  });
};
