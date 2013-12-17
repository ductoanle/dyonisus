async = require('async')
featured_list = require('../static/featured_list')

product_request = require ('../requests/products')

index = (request, response) ->
	request_functions = []
	for feature_item in featured_list 
		do (feature_item) ->
			request_functions.push (callback) ->
				setTimeout(->
					product_request.show(feature_item, (result) ->
            			callback null, result
					)
				, 2000)	
	async.parallel(request_functions, (err, results) ->
									      response.writeHead 200
									      responseBody = JSON.stringify(results)
									      response.write responseBody
									      response.end()
  )
		
module.exports.index = index
