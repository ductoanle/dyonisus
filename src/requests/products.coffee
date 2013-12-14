request = require('request')
url = require('url')
config = require('../config')

products_path = '/products'
product_path = '/product'

products_request = (req) ->
  category_id = req.params.category_id
  query_params = {}
  query_params[config.web_route_param] = config.web_route_value_prefix + products_path

  # options for constructing the request url
  options =
    protocol: 'http'
    host: config.web_url
    pathname: config.pathname
    query: query_params
  request_url = url.format options

  body_json = {}
  body_json["category" ] = category_id if category?
  body_json["key"] = config.web_api_key

  request_options =
        url: request_url
        method: 'POST'
        form: body_json

  console.log request_options
  request request_options, (err, response, body) ->
    console.log response

module.exports = products_request
