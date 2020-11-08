require_relative '../test_helper'
require_relative '../lib/item'
require_relative '../lib/promotional_rules'
require_relative '../lib/multi_buy_item_promotion'
require_relative '../lib/basket_percentage_discount_promotion'
require_relative '../mocks/mock_items'

class ChallengeTest < Minitest::Test
  def setup
    @rules = PromotionalRules.new.tap do |rules|
      rules.item_rules << MultiBuyItemPromotion.new(code: '001', price: 8.50, minimum: 2)
      rules.basket_rules << BasketPercentageDiscountPromotion.new(minimum: 60, percentage: 10)
    end
  end

  def test_data_one
    co = Checkout.new(@rules)
    co.scan(MockItems.heart)
    co.scan(MockItems.cufflinks)
    co.scan(MockItems.kids_tshirt)
    assert_equal 66.78, co.total
  end

  def test_data_two
    co = Checkout.new(@rules)
    co.scan(MockItems.heart)
    co.scan(MockItems.kids_tshirt)
    co.scan(MockItems.heart)
    assert_equal 36.95, co.total
  end

  def test_data_three
    co = Checkout.new(@rules)
    co.scan(MockItems.heart)
    co.scan(MockItems.cufflinks)
    co.scan(MockItems.heart)
    co.scan(MockItems.kids_tshirt)
    assert_equal 73.76, co.total
  end
end
