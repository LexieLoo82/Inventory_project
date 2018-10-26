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
  @supplies = Supplier.all()
erb (:"products/new")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to '/products'
end
