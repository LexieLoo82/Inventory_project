require_relative('../db/sql_runner')

class Supplier

  attr_reader( :id, )
  attr_accessor( :name, :distance)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @distance = options['distance'].to_i
  end

  def save()
    sql = "INSERT INTO suppliers (name, distance)
    VALUES( $1, $2)
    RETURNING id"
    values = [@name, @distance]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |supplier| Supplier.new( supplier ) }
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end

  def delete
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update
    sql = "UPDATE suppliers
    SET (name, distance) = ($1, $2)
    WHERE id = $3"
    values = [@name, @distance, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    supplier = SqlRunner.run(sql, values)
   return Supplier.new( supplier.first )
  end

  def products()
    sql = "SELECT * FROM products WHERE supplier_id = $1"
    values = [@id]
    products_return = SqlRunner.run(sql, values)
    products = products_return.map { |product| Product.new(product) }
    return products
  end

end
