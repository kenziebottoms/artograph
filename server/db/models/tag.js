'use strict';
module.exports = (sequelize, DataTypes) => {
  var Tag = sequelize.define('Tag', {
    name: DataTypes.STRING
  }, {});
  Tag.associate = function(models) {
    Tag.belongsToMany(models.Artist, {
      through: 'ArtistTags',
      foreignKey: 'tagId'
    });
  };
  return Tag;
};