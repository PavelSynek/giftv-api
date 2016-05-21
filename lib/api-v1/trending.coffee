Router = require('express').Router
request = require('request');

app = new Router()

app.get('/', (req, res, next)->
  request('http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC', (error, response, body)->
    res.send(body)
  )
)

module.exports = app