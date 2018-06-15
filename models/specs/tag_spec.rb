require('minitest/autorun')
require_relative('../tag')

class TagTest < Minitest::Test

  def setup
    options = {
      'id' => '1',
      'name' => 'Productivity'
    }

    @tag = Tag.new(options)
  end

  def test_id
    value = @tag.id()
    assert_equal(1, value)
  end

  def test_name
    value = @tag.name()
    assert_equal('Productivity', value)
  end

end
