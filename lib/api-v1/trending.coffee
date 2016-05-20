Router = require('express').Router

app = new Router()

app.get('/', (req, res, next)->
  res.send('sup')
)

module.exports = app