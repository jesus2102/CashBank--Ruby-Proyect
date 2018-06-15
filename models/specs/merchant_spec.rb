require('minitest/autorun')
require_relative('../merchant')

class MerchantTest < Minitest::Test

  def setup
    options = {
      'id' => '1',
      'name' => 'Amazon'
    }

    @merchant = Merchant.new(options)
  end

  def test_id
    value = @merchant.id()
    assert_equal(1, value)
  end

  def test_name
    value = @merchant.name()
    assert_equal('Amazon', value)
  end

end
