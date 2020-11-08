require_relative '../test_helper'
require_relative '../lib/promotional_rules'
require_relative '../mocks/mock_items'

class MockItemPromotion
  def apply(_)
    return [MockDiscountItem.cufflinks, MockDiscountItem.heart]
  end
end

class MockBasketPromotion
  def apply(price)
    price - 10
  end
end

class PromotionalRulesTest < Minitest::Test
  def setup
    @items = [MockItems.cufflinks, MockItems.heart]
  end

  def test_total_with_item_promotion
    promo = PromotionalRules.new
    promo.add_item_rule MockItemPromotion.new
    assert_equal 33.5, promo.total(@items)
  end

  def test_basket_promotional_rules
    promo = PromotionalRules.new
    promo.add_basket_rule MockBasketPromotion.new
    assert_equal 44.25, promo.total(@items)
  end

  def test_item_and_basket_rules
    promo = PromotionalRules.new
    promo.add_item_rule MockItemPromotion.new
    promo.add_basket_rule MockBasketPromotion.new
    assert_equal 23.5, promo.total(@items)
  end
end
