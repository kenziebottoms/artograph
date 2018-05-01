'use strict';
module.exports = (sequelize, DataTypes) => {
  var Artist = sequelize.define('Artist', {
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    lat: DataTypes.DECIMAL,
    lng: DataTypes.DECIMAL,
    insta: DataTypes.STRING
  }, {});
  Artist.associate = function(models) {
    // associations can be defined here
  };
  return Artist;
};