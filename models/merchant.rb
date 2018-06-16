require_relative('../db/sql_runner')

class Merchant

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    merchant = SqlRunner.run(sql, values)
    @id = merchant.first()['id'].to_i
  end

  def update()
    sql = "UPDATE merchants
    SET
    (
      name,
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end
end
