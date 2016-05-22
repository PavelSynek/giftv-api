Router = require('express').Router
request = require('request')
async = require('async')

app = new Router()

app.get('/', (req, res, next)->
  request('http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC', {json: true}, (error, response, body)->
    async.map(body.data,
      (gif, done)->
        request("https://api.spotify.com/v1/search?type=track&limit=1&offset=0&q=#{getQuery gif.slug}", {json: true}, (error, response, body)->
          if musicUrl = body.tracks.items[0]?.preview_url
            done(null, {
              gif: gif.images.original.mp4
              music: musicUrl
            })
          else done(null, null)
        )
    , (err, result)->
      res.send(result.filter((item)-> item))
    )
  )
)

getQuery = (slug)->
  slug.split('-')[0]

module.exports = app