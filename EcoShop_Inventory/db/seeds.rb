require_relative('../models/product')
require_relative('../models/supplier')
require( 'pry-byebug' )

Supplier.delete_all()

supplier1 = Supplier.new({"name" => "Burts Bees", "distance" => 24})
supplier2 = Supplier.new({"name" => "HumbleStuff", "distance" => 24})
supplier3 = Supplier.new({"name" => "One Green Bottle", "distance" => 50})
supplier4 = Supplier.new({"name" => "Eco Bags", "distance" => 350})
supplier5 = Supplier.new({"name" => "EcoTree", "distance" => 24})
supplier6 = Supplier.new({"name" => "East Coast Organics", "distance" => 50})
supplier1.save()
supplier2.save()
supplier3.save()
supplier4.save()
supplier5.save()
supplier6.save()

supplier1.distance = 350
supplier1.update

supplier1.delete()

binding.pry
nil
