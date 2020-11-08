require_relative '../test_helper'
require_relative '../lib/multi_buy_item_promotion'
require_relative '../mocks/mock_items'

class MultiBuyItemPromotionTest < Minitest::Test
  def test_discount_does_not_apply_when_quantity_criteria_is_not_met
    mock_promo = MultiBuyItemPromotion.new(code: '001', minimum: 3, price: 5)
    items = mock_promo.apply([MockItems.heart, MockItems.heart])
    assert items.all? { |item| item.price === 9.25 }
  end

  def test_discount_applies_when_meeting_minimum_quantity_criteria
    mock_promo = MultiBuyItemPromotion.new(code: '001', minimum: 3, price: 5)
    items = mock_promo.apply [MockItems.heart, MockItems.heart, MockItems.heart]
    assert items.all? { |item| item.price === 5 }
  end

  def test_discount_only_applies_for_correct_items
    mock_promo = MultiBuyItemPromotion.new(code: '001', minimum: 2, price: 5)
    items = [MockItems.heart, MockItems.cufflinks, MockItems.kids_tshirt]
    prices = items.map(&:price)
    assert_equal prices, mock_promo.apply(items).map(&:price)
  end
end
