Router = require('express').Router
Promise = require('bluebird')
database = require('../database')
request = require('request-promise')

app = new Router()

giphyRequest = {
  uri: 'http://api.giphy.com/v1/gifs/trending'
  qs: {
    api_key: 'dc6zaTOxFJmzC'
    limit: 3
  }
  json: true
}

spotifyRequest = (query)-> {
  uri: 'https://api.spotify.com/v1/search'
  qs: {
    type: 'track'
    limit: 1
    offset: 0
    q: query
  }
  json: true
}

app.get('/', (req, res, next)->
  request(giphyRequest).then((gifs)->
    return gifs.data
  ).map((gif)->
    request(spotifyRequest(getQuery(gif.slug)))
    .then((res)->
      if musicUrl = res.tracks.items[0]?.preview_url
        return {
          gif: gif.images.original.mp4
          music: musicUrl
        }
      else return null
    ))
  .filter((result)-> result)
  .map((result)->
    database.models.gif.create(result)
    return result
  )
  .then((result)->
    res.send(result)
  )
)

getQuery = (slug)->
  slug.split('-')[0]

module.exports = app