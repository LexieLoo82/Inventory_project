require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/suppliers_controller')
require_relative('controllers/products_controller')



get "/" do
  erb(:home)
end
