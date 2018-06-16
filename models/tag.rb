require_relative('../db/sql_runner')

class Tag

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    tag = SqlRunner.run(sql, values)
    @id = tag.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tags
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

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end
end
