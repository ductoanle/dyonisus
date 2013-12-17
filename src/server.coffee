express = require('express')
http = require('http')
path = require('path')

product = require('./routes/products')
feature = require('./routes/features')

module.exports.start = (port, address) ->
  app = express()

  app.set('views', path.join(__dirname, 'views'))
  app.set('view engine', 'jade')
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.json())
  app.use(express.urlencoded())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use(express.static(path.join(__dirname, 'public')))

  if ('development' == app.get('env'))
    app.use(express.errorHandler());
  app.get '/products', product.index
  app.get '/features', feature.index

  http.createServer(app).listen(port, ->
    console.log "Express server listening on port #{port}"
  )