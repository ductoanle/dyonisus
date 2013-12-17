product_request = require ('../requests/products')

index = (request, response) ->
  product_request.index request, response
  #res.render('index', { product: product_model });
module.exports.index = index
	