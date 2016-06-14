database = require('../lib/database')
api = require('../lib/api')
supertest = require('supertest')
assert = require('assert')

test = supertest(api)

describe('GifTV API', ()->
  describe('Categories', ()->
    beforeEach(()->
      database.drop().then(()-> database.sync())
    )

    it('works', (done)->
      test
      .get('/v1/trending')
      .expect(200)
      .end(done)
    )
  )
)