require('minitest/autorun')
require_relative('../merchand')

class MerchandTest < Minitest::Test

  def setup
    options = {
      'id' => '1',
      'name' => 'Amazon'
    }

    @merchand = Merchand.new(options)
  end

  def test_id
    value = @merchand.id()
    assert_equal(1, value)
  end

  def test_name
    value = @merchand.name()
    assert_equal('Amazon', value)
  end

end
