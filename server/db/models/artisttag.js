'use strict';
module.exports = (sequelize, DataTypes) => {
  var ArtistTag = sequelize.define('ArtistTag', {}, {});
  ArtistTag.associate = function(models) {
    // associations can be defined here
  };
  return ArtistTag;
};