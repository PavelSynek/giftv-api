express = require('express')
bodyParser = require('body-parser')

app = express()

app.use(bodyParser.json())

app.use('/v1', require('./api-v1'))

module.exports = app