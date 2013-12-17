async = require('async')
featured_list = require('../static/featured_list')
redis = require('redis')
client = redis.createClient()

product_request = require ('../requests/products')

generate_redis_key = ->
	key = ""
	for feature_item in featured_list 
		do (feature_item) ->
			key += feature_item
	key			

write_response = (response, results) ->
	response.writeHead 200
	responseBody = JSON.stringify(results)
	response.write responseBody
	response.end()		

index = (request, response) ->
	client.get(generate_redis_key(), (err, value) -> 
		if value?
			write_response response, JSON.parse(value)
		else
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
										write_response response, results
										client.set(generate_redis_key(), JSON.stringify(results))
										client.expire(generate_redis_key(), 1800)

			) 
	
  	)
		
module.exports.index = index
