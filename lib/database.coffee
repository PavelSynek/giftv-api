Sequelize = require('sequelize');

sequelize = new Sequelize(process.env.DATABASE_URL or 'sqlite://memory');

require('./model/v1')(sequelize)

module.exports = sequelize