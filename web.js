// Generated by CoffeeScript 1.10.0
(function() {
  var api, database;

  database = require('./lib/database');

  api = require('./lib/api');

  database.sync().then(function() {
    var port;
    port = process.env.PORT || 5000;
    return api.listen(port, function(err) {
      if (err) {
        return console.error('error listening on port', port, 'error:', err);
      }
      return console.log('listening on port', port);
    });
  })["catch"](console.error);

}).call(this);
