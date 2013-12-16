source = './src/'
config = require(source + 'config')
server = require(source + 'server')
server.start(config.port, config.address)