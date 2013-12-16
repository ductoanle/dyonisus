class Product 
  
  constructor: (id, name, description, image, price) ->
  	@.id = id
  	@.name = name
  	@.description = description
  	@.image = image
  	@.price = price

  @create: (productObj) ->
  	new Product(productObj.id, productObj.name, productObj.description, productObj.image, productObj.price)  	

  @fromJSON: (jsonStr) ->
  	json = JSON.parse jsonStr
  	if json.success == 1
  		json.products
  	else
  		nil

  id: ->
  	@.id
  
  name: ->
  	@.name

  description: ->
  	@.description

  image: ->
  	@.image

  price: ->
  	@.price  	
	  		
module.exports = Product


