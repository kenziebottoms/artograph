'use strict';
module.exports = (sequelize, DataTypes) => {
  var User = sequelize.define('User', {
    email: DataTypes.STRING,
    username: DataTypes.STRING,
    password: DataTypes.STRING,
    lat: DataTypes.DECIMAL,
    lng: DataTypes.DECIMAL
  }, {});
  User.associate = function(models) {
    User.belongsToMany(models.Artist, {
      through: 'Favorites',
      foreignKey: 'userId'
    });
  };
  return User;
};