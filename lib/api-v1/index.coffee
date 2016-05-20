Router = require('express').Router

app = new Router()

app.use('/trending', require('./trending'))

module.exports = app