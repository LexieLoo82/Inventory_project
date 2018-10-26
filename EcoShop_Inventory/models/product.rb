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

#   def save()
#     sql = "INSERT INTO products(
#     name,
#     type,
#     qty,
#     cost_price,
#     sell_price,
#     supplier_id,
#   )
#   VALUES ( $1, $2, $3, $4, $5, $6)
#   RETURNING id"
#   values = [@name, @type, @qty, @cost_price, @sell_price, @supplier_id]
#   results = SqlRunner.run(sql, values)
#   @id = results.first()['id'].to_i
# end

end
