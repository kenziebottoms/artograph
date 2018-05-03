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
    Artist.belongsToMany(models.Tag, {
      through: 'ArtistTags',
      foreignKey: 'ArtistId'
    });
  };
  return Artist;
};