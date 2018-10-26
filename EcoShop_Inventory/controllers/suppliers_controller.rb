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
