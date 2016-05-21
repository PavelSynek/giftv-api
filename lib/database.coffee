Sequelize = require('sequelize');

sequelize = new Sequelize('test', null, null, {
  dialect: 'sqlite'
});

require('./model/v1')(sequelize)

module.exports = sequelize