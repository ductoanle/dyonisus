product_request = require ('../requests/products')

module.exports = (request, response) ->
	product_request.get_products request, response
	#res.render('index', { product: product_model });

	