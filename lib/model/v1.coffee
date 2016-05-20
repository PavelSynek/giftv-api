Sequelize = require('sequelize');

module.exports = (database)->
  GifWithMusic = database.define('gif_with_music', {
    gif: Sequelize.STRING
  });