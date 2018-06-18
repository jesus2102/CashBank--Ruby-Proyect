require_relative('../db/sql_runner')

class Transaction

  attr_reader(:id, :merchant_id, :tag_id,:amount, :reference, :transaction_date)

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @tag_id = options['tag_id'].to_i()
    @amount = options['amount'].to_i()
    @reference = options['reference']
    @transaction_date = options['transaction_date']
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount, reference, transaction_date)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@merchant_id, @tag_id, @amount, @reference, @transaction_date]
    transaction = SqlRunner.run(sql, values)
    @id = transaction.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions
    SET
    (merchant_id, tag_id, amount, reference, transaction_date)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@merchant_id, @tag_id, @amount, @reference, @transaction_date, @id]
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

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run( sql, values )
    result = Transaction.new( transaction.first )
    return result
  end
end
