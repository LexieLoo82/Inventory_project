require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/supplier')
require_relative('../models/product')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all()
  erb(:"suppliers/index")
end

get '/suppliers/new' do
  erb(:"suppliers/new")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect to'/suppliers'
end

get '/suppliers/:id' do
  id = params['id']
  @supplier = Supplier.find(id)
  erb(:"suppliers/show")
end

get '/suppliers/edit/:id' do
  id = params['id']
  @supplier = Supplier.find(id)
  erb (:"suppliers/edit")
end

# # ßget help with this
# get '/suppliers/products/:id' do
#   id = params['id']
#   @supplier = Supplier.products()
#   erb(:"suppliers/products")
# end
