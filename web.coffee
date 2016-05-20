database = require('./lib/database')
api = require('./lib/api')

database.sync().then(()->
  port = process.env.PORT or 5000
  api.listen(port, (err)->
    if err
      return console.error('error listening on port', port, 'error:', err)
    console.log('listening on port', port)
  )
).catch(console.error)