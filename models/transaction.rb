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
end
