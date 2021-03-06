require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/product')
require_relative('../models/supplier')
also_reload( '../models/*' )

get '/products' do
  @products = Product.all()
  erb(:"products/index")
end

get '/products/new' do
  @suppliers = Supplier.all()
  erb (:"products/new")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end

get '/products/:id' do
  id = params['id']
  @product = Product.find(id)
  erb(:"products/show")
end

get '/products/edit/:id' do
  id = params['id']
  @suppliers = Supplier.all()
  @product = Product.find(id)
  erb (:"products/edit")
  end

  post '/products/:id' do
  Product.new(params).update()
  redirect to "/products"
  end

post "/products/:id/sell" do
  id = params['id']
  @product = Product.find(id)
  @product.sell_product()
  @product.update()
   redirect to "/products/#{id}"
end

post "/products/delete/:id" do
  id = params['id']
  @product = Product.find(id)
   @product.delete()
   redirect to "/products"
end
