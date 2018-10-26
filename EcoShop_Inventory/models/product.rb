require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :type, :qty, :cost_price, :sell_price, :supplier_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @qty = options['qty']
    @cost_price = options['cost_price']
    @sell_price = options['sell_price']
    @supplier_id = options['supplier_id'].to_i
  end

  def save()
    sql = "INSERT INTO products (
    name,
    type,
    qty,
    cost_price,
    sell_price,
    supplier_id
  )
  VALUES ( $1, $2, $3, $4, $5, $6)
  RETURNING id"
  values = [@name, @type, @qty, @cost_price, @sell_price, @supplier_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM products"
  results = SqlRunner.run( sql )
  return results.map { |product| Product.new( product ) }
end

def self.delete_all()
  sql = "DELETE FROM products"
  SqlRunner.run( sql )
end

def delete
  sql = "DELETE FROM products WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def update
  sql = "UPDATE products
  SET (name, type, qty, cost_price, sell_price, supplier_id) = ($1, $2, $3, $4, $5, $6)
  WHERE id = $7"
  values = [@name, @type, @qty, @cost_price, @sell_price, @supplier_id, @id]
  SqlRunner.run(sql, values)
end

def self.find( id )
  sql = "SELECT * FROM products WHERE id = $1"
  values = [id]
  product = SqlRunner.run(sql, values)
 return Product.new( product.first )

end

end
