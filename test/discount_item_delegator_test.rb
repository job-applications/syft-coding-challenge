require_relative '../test_helper'
require_relative '../lib/discount_item_delegator'

class ItemTest < Minitest::Test
  def test_price_is_overridden
    item = DiscountItemDelegator.discount(item: MockItems.heart, price: 6.00)
    assert_equal 6.00, item.price
  end

  def test_discount_is_true
    item = DiscountItemDelegator.discount(item: MockItems.heart, price: 6.00)
    assert_equal true, item.discount?
  end
end
