'use strict';
module.exports = (sequelize, DataTypes) => {
  var Favorite = sequelize.define('Favorite', {}, {});
  Favorite.associate = function(models) {
    // associations can be defined here
  };
  return Favorite;
};