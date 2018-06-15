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

end
