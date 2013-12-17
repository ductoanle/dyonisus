class Product 
  
  constructor: (id, name, description, images, price) ->
  	@.id = id
  	@.name = name
  	@.description = description
  	@.images = images
  	@.price = price

  @create: (productObj) ->
  	if productObj.thumb?
  		images = 
  			thumb: productObj.thumb
  			full: productObj.thumb
  	else
  		images = 
  			thumb: productObj.image
  			full: productObj.image
  	new Product(productObj.id, productObj.name, productObj.description, JSON.stringify(images), productObj.price)  	

  @createProductList: (productObjs)	->
  	productList = new Array()
  	for productObj in productObjs
  		do (productObj) ->
  			productList.push(Product.create(productObj))
  	productList

  @productsFromJSON: (jsonStr) ->
    json = JSON.parse jsonStr
    if json.success == 1
    	json.products
    else
    	[]	

  @productFromJSON: (jsonStr) ->
  	json = JSON.parse jsonStr
  	if json.success == 1
  		json.product
  	else
  		nil
  toJSON: ->
  	json =
  		id: @.id
  		name: @.name
  		description: @.description
  		images: @.images
  		price: @.price
	  		
module.exports = Product