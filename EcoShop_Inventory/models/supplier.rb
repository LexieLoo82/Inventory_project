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


end
