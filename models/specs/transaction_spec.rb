require('minitest/autorun')
require_relative('../transaction')

class TransactionTest < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'merchant_id' => 2,
      'tag_id' => 3,
      'reference' => 'Office chair',
      'transaction_date' => '18/06/2018 15:08'
    }

    @transaction = Transaction.new(options)
  end

  def test_id
    value = @transaction.id()
    assert_equal(1, value)
  end

  def test_merchant_id
    value = @transaction.merchant_id()
    assert_equal(2, value)
  end

  def test_id
    value = @transaction.tag_id()
    assert_equal(3, value)
  end

  def test_reference
    value = @transaction.reference()
    assert_equal('Office chair', value)
  end

  def test_date
    value = @transaction.transaction_date()
    assert_equal('18/06/2018 15:08', value)
  end


end
