request = require('request')
url = require('url')
config = require('../config')
Product = require('../models/product')

products_path = '/products'
product_path = '/product'

index = (req, res) ->
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
  body_json["category"] = category_id if category_id?
  body_json["key"] = config.web_api_key

  request_options =
        url: request_url
        method: 'POST'
        form: body_json

  request request_options, (err, response, body) ->
    productObjs = Product.productsFromJSON response.body
    products = Product.createProductList(productObjs)
    responseBody = JSON.stringify products
    res.writeHead 200
    res.write responseBody
    res.end()

show = (product_id, callback) ->
  query_params = {}
  query_params[config.web_route_param] = config.web_route_value_prefix + product_path

  #options for constructing the request url
  options =
    protocol: 'http'
    host: config.web_url
    pathname: config.pathname
    query: query_params
  request_url = url.format options
  body_json = {}
  body_json["id"] = product_id
  body_json["key"] = config.web_api_key

  request_options =
        url: request_url
        method: 'POST'
        form: body_json
  request request_options, (err, response, body) ->
    productObj = Product.productFromJSON response.body    
    product = Product.create productObj
    callback product
  

module.exports.index = index
module.exports.show = show
