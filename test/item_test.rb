require_relative '../test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test
  def test_price_returned
    assert_equal 9.50, Item.new(code: 'MOCK-001', name: 'Mock Item', price: 9.50).price
  end

  def test_discount_is_false
    assert_equal false, Item.new(code: 'MOCK-001', name: 'Mock Item', price: 9.50).discount?
  end
end
