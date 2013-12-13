products_request = require ('../requests/products')

module.exports = (request, response) ->
	result = products_request request
	console.log result
	#res.render('index', { product: product_model });

	