Sequelize = require('sequelize');

module.exports = (database)->
  gif = database.define('gif', {
    gif: Sequelize.STRING,
    music: Sequelize.STRING
  });

  category = database.define('category', {
    name: Sequelize.STRING
  })

  gif.belongsTo(category)