async = require('async')

product_request = require ('../requests/products')

execute = (err, results, response) ->
		console.log "Results #{results}"
		#res.writeHead 200
		#responseBody = JSON.stringify(results)
		#res.write responseBody
		#res.end()

index = (request, response) ->
	async.parallel([
			(execute) ->
				setTimeout(->
					#product_request.show(request, (result) ->
					#	console.log result
					#	execute null, result, response	
					#)
					execute null, "1", response
				, 2000)
			,(execute) ->
				setTimeout(->
					#product_request.show(request, (result) ->
					#	console.log result
					#	execute null, result, response
					#)
					execute null, "2", response
				, 2000)
		])
		
module.exports.index = index
