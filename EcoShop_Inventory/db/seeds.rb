require_relative('../models/product')
require_relative('../models/supplier')
require( 'pry-byebug' )

Supplier.delete_all()
Product.delete_all()

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

product1 = Product.new({
  "name" => "Bees Wax Wraps",
  "type" => "kitchen",
  "quantity" => 5,
  "cost_price" => 10,
  "sell_price" => 25,
  "supplier_id" => supplier1.id
  })
product1.save

product2 = Product.new({
  "name" => "Jam",
  "type" => "kitchen",
  "quantity" => 19,
  "cost_price" => 2,
  "sell_price" => 5,
  "supplier_id" => supplier3.id
})
product2.save

product3 = Product.new({
"name" => "Bamboo Mug",
"type" => "kitchen",
"quantity" => 0,
"cost_price" => 10,
"sell_price" => 25,
"supplier_id" => supplier5.id
})
product3.save

product4 = Product.new({
"name" => "Bamboo Mug",
"type" => "kitchen",
"quantity" => 5,
"cost_price" => 10,
"sell_price" => 25,
"supplier_id" => supplier5.id
})
product4.save


product1.type = "storage"
product1.update




binding.pry
nil
