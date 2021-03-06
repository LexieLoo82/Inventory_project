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
  @supplier.products()
  erb(:"suppliers/show")
end

get '/suppliers/edit/:id' do
  id = params['id']
  @supplier = Supplier.find(id)
  erb (:"suppliers/edit")
end

post '/suppliers/:id' do
Supplier.new(params).update()
redirect to "/suppliers"
end

get '/suppliers/products/:id' do
  id = params['id']
  @supplier = Supplier.products()
  erb(:"suppliers/products")
end

get '/suppliers/delete/:id' do
  id = params['id']
  @supplier = Supplier.find(id)
  erb(:"suppliers/delete")
end

post "/suppliers/:id/delete" do
   supplier = Supplier.find(params[:id])
   supplier.delete()
   redirect to "/suppliers"
end
