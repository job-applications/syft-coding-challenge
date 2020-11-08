require_relative '../test_helper'
require_relative '../lib/basket_percentage_discount_promotion'

class BasketPercentageDiscountPromotionTest < Minitest::Test
  def test_discount_on_minimum_value
    mock_promo = BasketPercentageDiscountPromotion.new(minimum: 200, percentage: 25)
    assert_equal 150, mock_promo.apply(200)
    assert_equal 100, mock_promo.apply(100)
  end

  def test_discount_value_rounding
    mock_promo = BasketPercentageDiscountPromotion.new(minimum: 1, percentage: 15)
    assert_equal 4.85, mock_promo.apply(5.71)
    assert_equal 4.88, mock_promo.apply(5.74)
  end
end
