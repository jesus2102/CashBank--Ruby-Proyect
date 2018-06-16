require_relative('../db/sql_runner')

class Transaction

  attr_reader(:id, :merchant_id, :tag_id, :reference, :transaction_date)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @tag_id = options['tag_id'].to_i()
    @reference = options['reference']
    @transaction_date = options['transaction_date']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      merchant_id, tag_id, reference, transaction_date
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@merchant_id, @tag_id, @reference, @transaction_date]
    transaction = SqlRunner.run(sql, values)
    @id = transaction.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      merchant_id,
      tag_id,
      reference,
      transaction_date
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@merchant_id, @tag_id, @reference, @transaction_date, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end
end
